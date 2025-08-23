# Brothers Gas Safety Training System

## Overview
A comprehensive web-based training management system for Brothers Gas, built with Java servlets, JSP, and MySQL. The system provides role-based access control for managing employee safety training programs, tracking progress, and generating reports.

## Features
- **User Authentication** - Secure login system with session management
- **Role-Based Access Control** - Admin and staff user roles with different permissions
- **Employee Management** - Add, update, and remove employee records
- **Training Program Management** - Create and manage training curricula
- **Training Assignment & Tracking** - Assign training to employees and track completion status
- **Dashboard Analytics** - Real-time statistics on training completion rates
- **Responsive Web Interface** - Professional JSP-based user interface

## Quick Start

### Prerequisites
- Java JDK 11+
- Maven 3.6+
- MySQL 5.7+

### Setup
1. **Clone the project**
   ```bash
   git clone [repository-url]
   cd BG_SAFETY_PROJECT
   ```

2. **Configure database**
   - Create MySQL database: `bg_safety_db`
   - Update credentials in `src/main/java/util/DBConnection.java`

3. **Build and run**
   ```bash
   mvn clean compile
   mvn tomcat7:run
   ```

4. **Access application**
   - URL: http://localhost:8080/BG_SAFETY_PROJECT
   - Default credentials: admin/pasword

## Documentation
- [📋 Project Setup Documentation](./PROJECT_SETUP_DOCUMENTATION.md)
- [🔗 API Endpoints](./API_ENDPOINTS.md)
- [🚀 Deployment Guide](./DEPLOYMENT_GUIDE.md)

## Project Structure
```
BG_SAFETY_PROJECT/
├── src/main/
│   ├── java/
│   │   ├── controller/     # Servlet controllers
│   │   ├── dao/           # Data access objects
│   │   ├── model/         # Data models
│   │   └── util/          # Utilities (DB connection)
│   └── webapp/
│       ├── WEB-INF/       # Protected resources
│       ├── *.jsp          # JSP pages
│       └── web.xml        # Web configuration
├── docs/                  # Project documentation
├── target/               # Build output
└── pom.xml              # Maven configuration
```

## Technology Stack
- **Backend**: Java Servlets, JSP
- **Database**: MySQL with JDBC
- **Build Tool**: Maven
- **Server**: Embedded Tomcat 7
- **Frontend**: JSP with embedded CSS/JavaScript

## Key Components

### Controllers (Servlets)
- `LoginServlet` - Authentication and session management
- `AdminServlet` - Dashboard statistics and admin functions
- `EmployeeServlet` - Employee CRUD operations
- `TrainingServlet` - Training program management
- `EmployeeTrainingServlet` - Training assignments

### Data Access Layer
- `UserDao` - User authentication
- `EmployeeDao` - Employee data operations
- `TrainingDao` - Training program operations
- `AdminDao` - Statistical queries

### Web Interface
- `index.jsp` - Homepage with login form
- `login.jsp` - Dedicated login page
- `dashboard.jsp` - Main dashboard after login
- Role-based content rendering

## API Endpoints
- `POST /login` - User authentication
- `GET /admin` - Dashboard statistics
- `GET|POST /employee` - Employee management
- `GET|POST /training` - Training management
- `GET|POST /employee-training` - Training assignments

## Development Status
✅ **PRODUCTION READY**
- Complete web interface implemented
- All core functionality working
- Database integration tested
- Authentication system operational
- Role-based access control functional

## Support & Maintenance
For issues, questions, or feature requests, refer to the documentation in the `docs/` folder or contact the development team.

---
*Last Updated: August 22, 2025*
*Version: 1.0*
*Status: Production Ready*