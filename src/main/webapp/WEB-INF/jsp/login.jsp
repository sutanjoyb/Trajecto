<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access - Trajecto</title>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        .auth-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(180deg, rgba(9, 13, 22, 0.6) 0%, rgba(9, 13, 22, 0.9) 100%), 
                        url('${pageContext.request.contextPath}/resources/images/train-bg.jpg') no-repeat center center/cover;
            padding: 2rem;
        }
        .auth-box {
            background: rgba(10, 16, 28, 0.88);
            backdrop-filter: blur(16px);
            padding: 2.25rem;
            border-radius: 12px;
            width: 100%;
            max-width: 420px;
            border: 1px solid rgba(255, 255, 255, 0.12);
            box-shadow: 0 20px 40px rgba(0,0,0,0.5);
            color: #fff;
        }
        .auth-box h2 {
            margin-bottom: 1.25rem;
            font-size: 1.6rem;
            font-weight: 600;
            text-align: center;
        }
        .form-group {
            margin-bottom: 0.9rem;
        }
        .form-group label {
            display: block;
            font-size: 0.75rem;
            color: #94a3b8;
            margin-bottom: 0.25rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .form-group input {
            width: 100%;
            padding: 0.65rem 0.75rem;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 6px;
            color: #fff;
            font-size: 0.9rem;
            outline: none;
        }
        .form-group input:focus {
            border-color: #38bdf8;
        }
        .error-msg {
            color: #f87171;
            font-size: 0.85rem;
            margin-bottom: 1rem;
            text-align: center;
        }
        .success-msg {
            color: #4ade80;
            font-size: 0.85rem;
            margin-bottom: 1rem;
            text-align: center;
        }
        .auth-tabs {
            display: flex;
            margin-bottom: 1.5rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .auth-tab {
            flex: 1;
            background: none;
            border: none;
            color: #94a3b8;
            font-size: 0.95rem;
            font-weight: 500;
            padding: 0.5rem;
            cursor: pointer;
            transition: all 0.3s;
        }
        .auth-tab.active {
            color: #38bdf8;
            border-bottom: 2px solid #38bdf8;
        }
        .form-section {
            display: none;
        }
        .form-section.active {
            display: block;
        }
        .back-home {
            display: block;
            text-align: center;
            margin-top: 1.25rem;
            color: #94a3b8;
            text-decoration: none;
            font-size: 0.85rem;
        }
        .back-home:hover {
            color: #fff;
        }
    </style>
</head>
<body>

    <div class="auth-container">
        <div class="auth-box">
            <h2>Trajecto Portal</h2>

            <% String err = (String) request.getAttribute("errorMessage"); %>
            <% if (err != null) { %>
                <div class="error-msg"><%= err %></div>
            <% } %>

            <% String succ = (String) request.getAttribute("successMessage"); %>
            <% if (succ != null) { %>
                <div class="success-msg"><%= succ %></div>
            <% } %>

            <div class="auth-tabs">
                <button class="auth-tab active" onclick="switchTab('login')">Login</button>
                <button class="auth-tab" onclick="switchTab('register')">Register</button>
            </div>

            <div id="login-section" class="form-section active">
                <form action="login-action" method="post">
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" required placeholder="Enter your email">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" required placeholder="Enter password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block" style="margin-top: 0.5rem; width: 100%;">Login</button>
                </form>
            </div>

            <div id="register-section" class="form-section">
                <form action="register-action" method="post">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="fullName" required placeholder="Enter your full name">
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" required placeholder="Enter your email">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" required placeholder="Create a password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block" style="margin-top: 0.5rem; width: 100%;">Register</button>
                </form>
            </div>

            <a href="${pageContext.request.contextPath}/" class="back-home">&larr; Back to Home</a>
        </div>
    </div>

    <script>
        function switchTab(tab) {
            document.querySelectorAll('.auth-tab').forEach(t => t.classList.remove('active'));
            document.querySelectorAll('.form-section').forEach(s => s.classList.remove('active'));
            
            if (tab === 'login') {
                document.querySelectorAll('.auth-tab')[0].classList.add('active');
                document.getElementById('login-section').classList.add('active');
            } else {
                document.querySelectorAll('.auth-tab')[1].classList.add('active');
                document.getElementById('register-section').classList.add('active');
            }
        }
    </script>
</body>
</html>