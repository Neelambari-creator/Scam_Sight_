# 🔍 ScamSight –  An Explainable Web Based Scam and Phishing risk analysis system

**ScamSight** is a Java-based web application designed to analyze suspicious messages and URLs to help users identify potential online scams.

The application provides a user-friendly interface for analyzing messages and URLs, viewing analysis results, and maintaining scan history.

## 🚀 Project Overview

Online scams and fraudulent messages are increasing rapidly. ScamSight aims to help users examine suspicious digital content and recognize potential scam indicators through a web-based application.

The application includes user authentication, message analysis, URL analysis, and scan history management.

## ✨ Features

- **User Registration:** Create a new user account.
- **User Login:** Secure user authentication.
- **Message Analysis:** Analyze suspicious text messages.
- **URL Analysis:** Examine URLs for potential scam indicators.
- **Analysis Results:** Display the results of the analysis.
- **Scan History:** View previous scan records.
- **Password Security:** Password hashing using BCrypt.
- **Database Integration:** Store user information and scan records using MySQL.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Java | Backend development |
| JSP | Dynamic web pages |
| Servlets | Request handling |
| HTML | Page structure |
| CSS | User interface design |
| JavaScript | Client-side functionality |
| MySQL | Database management |
| JDBC | Database connectivity |
| Maven | Dependency management and build |
| Apache Tomcat | Web application server |
| jBCrypt | Password hashing |

## 📂 Project Structure

```text
ScamSight/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/scamsight/
│       │       ├── dao/
│       │       ├── model/
│       │       └── servlet/
│       │
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── css/
│           ├── images/
│           ├── login.jsp
│           ├── register.jsp
│           ├── message-analyzer.jsp
│           ├── url-analyzer.jsp
│           ├── result.jsp
│           └── history.jsp
│
├── pom.xml
└── README.md
```

## ⚙️ Requirements

- JDK 17
- Apache Maven
- Apache Tomcat (compatible with the project's Jakarta Servlet version)
- MySQL Server
- MySQL Workbench (optional)
- Visual Studio Code or IntelliJ IDEA

## ▶️ How to Run the Project

1. Clone the repository:

```bash
git clone https://github.com/Neelambari-creator/Scam_Sight_.git
```

2. Open the project folder:

```bash
cd Scam_Sight_
```

3. Configure your MySQL database connection according to the database settings in the project.

4. Build the project using Maven:

```bash
mvn clean package
```

5. Deploy the generated WAR file from the `target` folder to your configured Apache Tomcat server.

6. Start the Tomcat server.

7. Open the application in your browser using the appropriate Tomcat application URL.

## 🎯 Project Objectives

- Help users examine suspicious messages and URLs.
- Provide a simple interface for potential scam identification.
- Maintain user accounts and scan history.
- Demonstrate Java web development and database integration.

## 🔮 Future Enhancements

- Improve scam detection accuracy.
- Integrate machine learning-based scam detection.
- Add real-time threat intelligence.
- Improve URL reputation analysis.
- Enhance security monitoring and reporting.

## 👩‍💻 Developer

**Neelambari V.**

GitHub: [Neelambari-creator](https://github.com/Neelambari-creator)

---

⭐ If you find this project interesting, consider giving the repository a star!

*Disclaimer: ScamSight is an academic project. Its analysis results should be treated as indicators and not as a guarantee that a message or URL is safe or fraudulent.*
