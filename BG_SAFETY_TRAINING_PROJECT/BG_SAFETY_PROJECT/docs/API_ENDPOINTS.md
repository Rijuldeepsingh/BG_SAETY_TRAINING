# BG Safety Training Project - API Documentation

## Base URL
```
http://localhost:8080/BG_SAFETY_PROJECT
```

## Authentication Endpoints

### POST /login
Authenticates user credentials and creates session.

**Request:**
```bash
curl -X POST "http://localhost:8080/BG_SAFETY_PROJECT/login" \
  -d "username=admin&password=pasword" \
  -H "Content-Type: application/x-www-form-urlencoded"
```

**Response:**
- **Success**: Redirects to `dashboard.jsp`
- **Failure**: Returns `login.jsp` with error message

**Parameters:**
- `username` (string, required) - User login name
- `password` (string, required) - User password

### GET /logout
Terminates user session and redirects to login.

## Management Endpoints

### GET /admin
Displays admin dashboard with training statistics.

**Authentication Required:** Admin role

**Response:** Dashboard with employee training counts

### GET|POST /employee
Employee management operations.

**GET**: List all employees
**POST**: Add/update/delete employees

**Parameters for POST:**
- `action` (string) - "add", "update", "delete"
- `name` (string) - Employee name
- `position` (string) - Employee position
- `employeeId` (number) - For update/delete operations

### GET|POST /training
Training program management.

**GET**: List all training programs
**POST**: Add/update/delete training programs

**Parameters for POST:**
- `action` (string) - "add", "update", "delete"
- `title` (string) - Training title
- `description` (string) - Training description
- `trainingId` (number) - For update/delete operations

### GET|POST /employee-training
Employee training assignment management.

**GET**: List training assignments
**POST**: Assign/update training status

**Parameters for POST:**
- `employeeId` (number) - Employee ID
- `trainingId` (number) - Training program ID
- `status` (string) - "in_training", "completed"

## Web Pages

### GET /
Main application homepage with login form.

### GET /login.jsp
Direct access to login page.

### GET /dashboard.jsp
User dashboard (requires authentication).

## Response Formats

### Success Responses
- **Web Interface**: HTML pages with forms and data
- **Redirects**: HTTP 302 redirects to appropriate pages

### Error Responses
- **Authentication Failed**: Login page with error message
- **Access Denied**: Redirect to login page
- **Not Found**: HTTP 404 for invalid endpoints

## Authentication & Sessions

### Session Management
- Sessions created on successful login
- User object stored in session with role information
- Session required for all protected endpoints

### User Roles
- **admin**: Full access to all management functions
- **staff/user**: Limited access to training assignments

## Database Integration

### Connection Details
- **Database**: `bg_safety_db`
- **Host**: `localhost:3306`
- **Driver**: MySQL JDBC connector

### Tables Used
- `users` - User authentication data
- `employees` - Employee information
- `training` - Training programs
- `employee_training` - Training assignments and status

---
*API Documentation created: August 22, 2025*
*Version: 1.0*
*Status: Production Ready*