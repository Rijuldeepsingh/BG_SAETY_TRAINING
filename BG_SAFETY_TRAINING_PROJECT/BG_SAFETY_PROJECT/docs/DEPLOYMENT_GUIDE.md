# BG Safety Training Project - Deployment Guide

## Prerequisites

### Software Requirements
- **Java JDK**: Version 11 or higher (currently using Java 22)
- **Maven**: Version 3.6+ (currently using 3.9.11)
- **MySQL**: Version 5.7+ or 8.0+
- **Git**: For version control

### System Setup
1. **Install Java JDK**
   - Download from Oracle or use OpenJDK
   - Set `JAVA_HOME` environment variable
   - Add Java bin directory to PATH

2. **Install Maven**
   - Download from https://maven.apache.org/download.cgi
   - Extract to desired location (e.g., `C:\apache-maven-3.9.11`)
   - Add Maven bin directory to PATH
   - Set `MAVEN_HOME` environment variable

3. **Install MySQL**
   - Download and install MySQL Server
   - Create database: `bg_safety_db`
   - Set up user credentials (default: root/root)

## Project Setup

### 1. Clone/Download Project
```bash
git clone [repository-url]
cd BG_SAFETY_PROJECT
```

### 2. Database Configuration
Update database credentials in `src/main/java/util/DBConnection.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/bg_safety_db";
private static final String USERNAME = "root";
private static final String PASSWORD = "root";
```

### 3. Verify Maven Configuration
Check `pom.xml` contains:
```xml
<properties>
    <maven.compiler.source>11</maven.compiler.source>
    <maven.compiler.target>11</maven.compiler.target>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
</properties>
```

## Build and Deployment

### 1. Clean and Compile
```bash
mvn clean compile
```

### 2. Run Development Server
```bash
mvn tomcat7:run
```

**Server will start on:** `http://localhost:8080/BG_SAFETY_PROJECT`

### 3. Verify Deployment
- **Homepage**: http://localhost:8080/BG_SAFETY_PROJECT/
- **Login Page**: http://localhost:8080/BG_SAFETY_PROJECT/login.jsp
- **Test API**: POST to http://localhost:8080/BG_SAFETY_PROJECT/login

## Production Deployment

### 1. Build WAR File
```bash
mvn clean package
```
WAR file will be created in `target/BG_SAFETY_PROJECT-0.0.1-SNAPSHOT.war`

### 2. Deploy to Tomcat Server
1. Copy WAR file to Tomcat `webapps` directory
2. Start Tomcat server
3. Access application at: `http://[server]:8080/BG_SAFETY_PROJECT`

### 3. External Tomcat Configuration
Update `server.xml` if needed for:
- Port configuration
- SSL/HTTPS setup
- Database connection pooling

## Troubleshooting

### Common Issues

**Port Already in Use (8080)**
```bash
# Check what's using the port
netstat -ano | grep :8080

# Kill the process (Windows)
powershell.exe -Command "Stop-Process -Id [PID] -Force"
```

**Maven Not Found**
- Verify Maven is in PATH
- Check `mvn --version` works
- Restart command prompt/terminal after PATH changes

**Database Connection Failed**
- Verify MySQL is running
- Check database exists: `SHOW DATABASES;`
- Verify credentials in DBConnection.java
- Test connection with: `mysql -u root -p`

**Compilation Errors**
- Verify Java version compatibility
- Check JAVA_HOME points to correct JDK
- Clear Maven cache: `mvn clean`

### Log Locations
- **Maven logs**: Console output during build
- **Tomcat logs**: `target/tomcat/logs/`
- **Application logs**: Check console for System.out.println statements

## Monitoring and Maintenance

### Health Checks
- **Application Status**: http://localhost:8080/BG_SAFETY_PROJECT/
- **Database Connection**: Check login functionality
- **API Endpoints**: Test each endpoint with curl/Postman

### Regular Maintenance
- **Database Backups**: Backup `bg_safety_db` regularly
- **Log Rotation**: Monitor and rotate log files
- **Security Updates**: Keep Java, Maven, and MySQL updated

### Performance Optimization
- **Database Indexing**: Add indexes on frequently queried columns
- **Connection Pooling**: Configure for production environments
- **Memory Settings**: Adjust JVM heap size for production

---
*Deployment Guide created: August 22, 2025*
*Project: Brothers Gas Safety Training System*
*Environment: Development & Production Ready*