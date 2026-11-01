# Trajecto - Web Application for Train Ticket Booking

Trajecto is a high-end, full-stack web application designed to make train ticket reservations simple, seamless, and hassle-free.

## Features

- **Multi-Step Booking Workflow:** A clean four-step booking wizard that guides users from journey selection to ticket reservation smoothly.
- **Dynamic Passenger Booking:** Supports booking for up to 6 passengers at a time, with individual berth preferences such as Lower Berth, Upper Berth, Side Lower, Side Upper, etc.
- **Ticket Management:** Allows users to view their e-tickets and delete bookings, including active and previous reservations.
- **Enterprise-Class Architecture:** Built using the Spring MVC / Spring Boot framework, packaged as a WAR file, and deployed on Apache Tomcat.

## Technology Stack

| Component               | Technologies                                     |
| ----------------------- | ------------------------------------------------ |
| **Back-End**            | Java, Spring Boot, Spring MVC, Maven             |
| **Front-End**           | Java Server Pages (JSP), HTML5, CSS3, JavaScript |
| **Server / Deployment** | Apache Tomcat (Servlet Container)                |
| **Operating System**    | Linux (Fedora)                                   |
| **Packaging**           | WAR (Web Application Archive)                    |

## Project Structure

````text
## Project Structure

```text
Trajecto/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── example/
│       │           └── demo/
│       │               ├── controller/
│       │               │   └── HomeController.java
│       │               │
│       │               ├── model/
│       │               │   ├── User.java
│       │               │   ├── Train.java
│       │               │   └── Ticket.java
│       │               │
│       │               ├── service/
│       │               │   └── TicketService.java
│       │               │   └── UserService.java
│       │               │
│       │               └── ServletInitializer.java
│       │
│       ├── resources/
│       │   └── application.properties
│       │
│       └── webapp/
│           └── WEB-INF/
│               └── jsp/
│                   ├── index.jsp
│                   ├── login.jsp
│                   └── dashboard.jsp
│
├── target/
│
├── .gitattributes
├── .gitignore
├── HELP.md
├── mvnw
├── mvnw.cmd
├── pom.xml
└── README.md
````

## Local Installation & Deployment

### Prerequisites

Make sure the following software is installed on your system:

- Java Development Kit (JDK 17 or later)
- Apache Tomcat 10+
- Apache Maven
- Git

### 1. Clone the Repository

```bash
git clone https://github.com/sutanjoyb/Trajecto.git

cd Trajecto
```

### 2. Package the Application as a WAR File

Run the following command from the project root directory:

```bash
./mvnw clean package
```

This generates the deployable WAR file inside the `target/` directory.

### 3. Deploy to Apache Tomcat

Copy the generated WAR file to the Tomcat web applications directory:

```bash
sudo rm -rf /var/lib/tomcat/webapps/ROOT
sudo rm -f /var/lib/tomcat/webapps/ROOT.war

sudo cp target/demo-0.0.1-SNAPSHOT.war \
/var/lib/tomcat/webapps/ROOT.war

sudo chown tomcat:tomcat \
/var/lib/tomcat/webapps/ROOT.war
```

### 4. Start or Restart Tomcat

```bash
sudo systemctl restart tomcat
```

### 5. Access the Application

Once Tomcat has successfully deployed the application, open your browser and navigate to:

**http://localhost:8080/**

## Developed by:

**Sutanjoy Bhattacharjee**

## License

This project is developed for educational and learning purposes.
