<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Trajecto</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Cinzel:wght@500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        :root {
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Plus Jakarta Sans', sans-serif; }

        body {
            background: linear-gradient(135deg, rgba(7, 10, 16, 0.82), rgba(7, 10, 16, 0.94)),
                        url('${pageContext.request.contextPath}/resources/images/train-bg2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-y: auto;
        }

        .dashboard-wrapper {
            width: 100%;
            max-width: 100%;
            margin: 0;
            padding: 2.5rem 5rem;
            flex: 1;
        }

        @media (max-width: 768px) {
            .dashboard-wrapper { padding: 2rem 1.5rem; }
        }

        .top-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 3rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding-bottom: 1rem;
            width: 100%;
        }

        .top-nav h1 {
            font-size: 2rem;
            font-weight: 600;
            font-family: 'Cinzel', serif;
            text-shadow: 0 2px 10px rgba(0,0,0,0.8);
        }

        .logout-btn {
            color: var(--text-muted);
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 500;
            transition: color 0.2s;
        }
        .logout-btn:hover { color: #fff; }

        .left-sidebar {
            position: fixed;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            display: flex;
            flex-direction: column;
            gap: 15px;
            z-index: 100;
        }

        .sidebar-icon-btn {
            width: 48px;
            height: 48px;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: 12px;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            transition: all 0.3s ease;
            text-decoration: none;
        }
        .sidebar-icon-btn:hover {
            background: rgba(255, 255, 255, 0.18);
            border-color: rgba(255, 255, 255, 0.5);
            transform: scale(1.05);
        }

        .wizard-section {
            margin-top: 4vh;
            margin-bottom: 6rem;
            width: 100%;
        }

        .step-container {
            display: none;
            animation: fadeIn 0.4s ease-out;
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            text-align: left;
        }

        .step-container.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .step-label {
            font-size: 0.85rem;
            color: #94a3b8;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 1.5px;
            margin-bottom: 0.75rem;
        }

        .step-title {
            font-size: 2.5rem;
            font-weight: 700;
            font-family: 'Cinzel', serif;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 15px rgba(0,0,0,0.8);
        }

        .step-desc {
            color: var(--text-muted);
            font-size: 1.1rem;
            margin-bottom: 2.5rem;
            text-shadow: 0 1px 8px rgba(0,0,0,0.8);
        }

        .form-control-group {
            margin-bottom: 1.75rem;
            width: 100%;
            margin-left: auto;
            margin-right: auto;
        }

        .form-control-group label {
            display: block;
            font-size: 0.85rem;
            color: var(--text-muted);
            text-transform: uppercase;
            margin-bottom: 0.5rem;
            letter-spacing: 0.5px;
        }

        .form-control-group input, .form-control-group select {
            width: 100%;
            padding: 1rem 1.25rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            color: #fff;
            font-size: 1.1rem;
            outline: none;
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            transition: all 0.3s ease;
        }

        .form-control-group input:hover, .form-control-group select:hover {
            border-color: rgba(255, 255, 255, 0.4);
        }

        .form-control-group input:focus, .form-control-group select:focus {
            border-color: rgba(255, 255, 255, 0.6);
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
        }

        .form-control-group select option {
            background: #090d16;
            color: #fff;
        }

        .wizard-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2.5rem;
            justify-content: flex-start;
        }

        
        .btn-action, .btn-secondary-action, .modal-close-btn {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.25);
            color: #ffffff;
            padding: 0.9rem 2.2rem;
            border-radius: 10px;
            font-weight: 600;
            font-size: 1.05rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
        }

        .btn-action:hover, .btn-secondary-action:hover, .modal-close-btn:hover {
            background: rgba(255, 255, 255, 0.18);
            border-color: rgba(255, 255, 255, 0.5);
            transform: translateY(-2px);
            box-shadow: 0 12px 40px 0 rgba(0, 0, 0, 0.45);
        }

        .modal-overlay {
            display: none;
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(5, 8, 14, 0.75);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            justify-content: center;
            align-items: center;
            z-index: 1000;
            padding: 1rem;
        }

        .modal-card {
            background: rgba(10, 16, 28, 0.75);
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            color: var(--text-main);
            border: 1px solid rgba(255, 255, 255, 0.25);
            padding: 2.5rem;
            border-radius: 20px;
            width: 100%;
            max-width: 850px;
            max-height: 85vh;
            overflow-y: auto;
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.6), inset 0 0 0 1px rgba(255, 255, 255, 0.1);
            animation: modalPop 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes modalPop {
            from { opacity: 0; transform: scale(0.95) translateY(10px); }
            to { opacity: 1; transform: scale(1) translateY(0); }
        }

        .modal-card h3 {
            color: var(--text-main);
            font-family: 'Cinzel', serif;
        }

        .modal-card table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 1rem; 
        }
        .modal-card th, .modal-card td { 
            padding: 1rem; 
            text-align: left; 
            border-bottom: 1px solid rgba(255, 255, 255, 0.1); 
            font-size: 0.95rem; 
            color: var(--text-main); 
        }
        .modal-card th { 
            color: #94a3b8; 
            font-weight: 600; 
            text-transform: uppercase; 
            font-size: 0.75rem; 
            letter-spacing: 0.5px; 
        }
        .modal-card .badge { 
            background: rgba(16, 185, 129, 0.2); 
            border: 1px solid rgba(16, 185, 129, 0.4);
            color: #34d399; 
            padding: 0.25rem 0.6rem; 
            border-radius: 6px; 
            font-size: 0.75rem; 
        }

        .actions-cell {
            display: flex;
            flex-direction: column;
            gap: 6px;
            min-width: 80px;
        }
        .btn-table-view {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #f8fafc;
            padding: 0.4rem 0.8rem;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.85rem;
            font-weight: 500;
            text-align: center;
            transition: all 0.2s;
        }
        .btn-table-view:hover { background: rgba(255, 255, 255, 0.15); border-color: rgba(255, 255, 255, 0.4); }
        
        .btn-table-delete {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #f87171;
            padding: 0.4rem 0.8rem;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.85rem;
            font-weight: 500;
            text-align: center;
            transition: all 0.2s;
        }
        .btn-table-delete:hover { background: rgba(239, 68, 68, 0.25); border-color: rgba(239, 68, 68, 0.6); }

        .trajecto-footer {
            background: rgba(7, 10, 16, 0.95);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding: 1.5rem 3rem;
            margin-top: auto;
            text-align: center;
            width: 100%;
        }
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            color: var(--text-muted);
            font-size: 0.95rem;
        }
        .social-links { display: flex; gap: 1rem; font-size: 1.2rem; }
        .social-links a { color: var(--text-muted); transition: color 0.2s; }
        .social-links a:hover { color: #fff; }
    </style>
</head>
<body>

    
    <div class="left-sidebar">
        <button type="button" class="sidebar-icon-btn" onclick="openTicketsModal()" title="View Booked Tickets">
            <i class="fa-solid fa-ticket"></i>
        </button>
    </div>

    <div class="dashboard-wrapper">
        
        <div class="top-nav">
            <h1>Welcome, ${user.fullName}</h1>
            <a href="${pageContext.request.contextPath}/logout" class="logout-btn"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>

        <c:if test="${not empty bookingSuccess}">
            <div id="successBanner" style="color: #34d399; margin-bottom: 2rem; font-weight: 500; font-size: 1.1rem; transition: opacity 0.5s ease; max-width: 800px; margin-left: auto; margin-right: auto;">
                <i class="fa-solid fa-circle-check"></i> ${bookingSuccess}
            </div>
        </c:if>

        
        <div class="wizard-section">
            <form action="book-ticket" method="post" id="mainBookingForm">
                <input type="hidden" name="trainName" id="finalTrainPayload">
                <input type="hidden" name="travelDate" id="finalDatePayload">
                <input type="hidden" name="passengerName" id="finalPassengerPayload">

                
                <div class="step-container active" id="wizard-step-1">
                    <div class="step-label">Step 1 of 4</div>
                    <div class="step-title">Journey & Train Selection</div>
                    <div class="step-desc">Enter your route, pick your preferred express train, and travel date.</div>

                    <div class="form-control-group">
                        <label>From (Source Station)</label>
                        <input type="text" id="sourceInput" placeholder="e.g. New Delhi, Bangalore, Kolkata..." required>
                    </div>

                    <div class="form-control-group">
                        <label>To (Destination Station)</label>
                        <input type="text" id="destInput" placeholder="e.g. Mumbai, Chennai, Goa..." required>
                    </div>

                    <div class="form-control-group">
                        <label>Select Express Train</label>
                        <select id="trainSelect" required>
                            <option value="Rajdhani Express">Rajdhani Express</option>
                            <option value="Vande Bharat Express">Vande Bharat Express</option>
                            <option value="Shatabdi Express">Shatabdi Express</option>
                            <option value="Tejas Express">Tejas Express</option>
                            <option value="Duronto Express">Duronto Express</option>
                            <option value="Garib Rath">Garib Rath</option>
                            <option value="Humsafar Express">Humsafar Express</option>
                            <option value="Gatimaan Express">Gatimaan Express</option>
                        </select>
                    </div>

                    <div class="form-control-group">
                        <label>Travel Date</label>
                        <input type="date" id="dateInput" required>
                    </div>

                    <div class="wizard-buttons">
                        <button type="button" class="btn-action" onclick="goToStep(2)">Next Step <i class="fa-solid fa-arrow-right"></i></button>
                    </div>
                </div>

                
                <div class="step-container" id="wizard-step-2">
                    <div class="step-label">Step 2 of 4</div>
                    <div class="step-title">Coach Class & Group Size</div>
                    <div class="step-desc">Select your travel tier and number of passengers.</div>

                    <div class="form-control-group">
                        <label>Coach Class</label>
                        <select name="coachClass" id="coachClass" required>
                            <option value="General">General (₹350 / person)</option>
                            <option value="Sleeper" selected>Sleeper (₹750 / person)</option>
                            <option value="3AC">AC 3 Tier (₹1,500 / person)</option>
                            <option value="2AC">AC 2 Tier (₹2,300 / person)</option>
                            <option value="1AC">AC First Class (₹3,500 / person)</option>
                        </select>
                    </div>

                    <div class="form-control-group">
                        <label>Number of Passengers (1 - 6)</label>
                        <input type="number" id="numPassengers" value="1" min="1" max="6" required>
                    </div>

                    <div class="wizard-buttons">
                        <button type="button" class="btn-secondary-action" onclick="goToStep(1)"><i class="fa-solid fa-arrow-left"></i> Previous</button>
                        <button type="button" class="btn-action" onclick="buildPassengerInputs()">Next Step <i class="fa-solid fa-arrow-right"></i></button>
                    </div>
                </div>

                
                <div class="step-container" id="wizard-step-3">
                    <div class="step-label">Step 3 of 4</div>
                    <div class="step-title" id="passengerTitle">Passenger & Seat Details</div>
                    <div class="step-desc">Enter full name, age, gender, and seat preference for all travelers.</div>

                    <div id="dynamicPassengerFields" style="width: 100%;">
                        
                    </div>

                    <div class="wizard-buttons">
                        <button type="button" class="btn-secondary-action" onclick="goToStep(2)"><i class="fa-solid fa-arrow-left"></i> Previous</button>
                        <button type="button" class="btn-action" onclick="prepareReview()">Review Booking <i class="fa-solid fa-arrow-right"></i></button>
                    </div>
                </div>

            
                <div class="step-container" id="wizard-step-4">
                    <div class="step-label">Step 4 of 4</div>
                    <div class="step-title">Review & Confirm</div>
                    <div class="step-desc">Verify your journey summary before confirming generation.</div>

                    <div style="background: rgba(255,255,255,0.04); backdrop-filter: blur(12px); border: 1px solid rgba(255,255,255,0.15); padding: 1.5rem; border-radius: 12px; margin-bottom: 2.5rem; width: 100%; line-height: 1.7;">
                        <div><strong>Route:</strong> <span id="reviewRoute">--</span></div>
                        <div><strong>Train:</strong> <span id="reviewTrain">--</span></div>
                        <div><strong>Date:</strong> <span id="reviewDate">--</span></div>
                        <div><strong>Class:</strong> <span id="reviewClass">--</span></div>
                        <div><strong>Passengers & Seats:</strong><div id="reviewPassengers" style="color: var(--text-muted); margin-left: 1rem;">--</div></div>
                        <div style="margin-top: 1rem; border-top: 1px solid rgba(255,255,255,0.1); padding-top: 1rem;">
                            <strong>Total Fare:</strong> <span id="reviewFare" style="color: #34d399; font-size: 1.3rem;">₹0</span>
                        </div>
                    </div>

                    <div class="wizard-buttons">
                        <button type="button" class="btn-secondary-action" onclick="goToStep(3)"><i class="fa-solid fa-arrow-left"></i> Previous</button>
                        <button type="submit" class="btn-action"><i class="fa-solid fa-check"></i> Confirm & Generate Ticket</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    
    <div class="modal-overlay" id="ticketsModal">
        <div class="modal-card">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem; border-bottom: 1px solid rgba(255, 255, 255, 0.1); padding-bottom: 1rem;">
                <h3 style="font-size: 1.3rem;"><i class="fa-solid fa-ticket" style="color: #cbd5e1;"></i> My Booked Tickets</h3>
                <button type="button" onclick="closeTicketsModal()" style="background:none; border:none; color:var(--text-muted); font-size:1.3rem; cursor:pointer;"><i class="fa-solid fa-xmark"></i></button>
            </div>
            
            <c:if test="${empty tickets}">
                <p style="color: var(--text-muted); font-size: 0.95rem;">No tickets booked yet for this account.</p>
            </c:if>
            <c:if test="${not empty tickets}">
                <table>
                    <thead>
                        <tr>
                            <th>PNR</th>
                            <th>No. of Passengers</th>
                            <th>Train</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ticket" items="${tickets}">
                            <tr id="row-${ticket.pnr}">
                                <td style="font-weight: 600; color: #fff;">${ticket.pnr}</td>
                                <td>
                                    
                                    <span class="p-count-badge" data-passengers="${ticket.passengerName}"></span>
                                </td>
                                <td>${ticket.trainName}</td>
                                <td>${ticket.travelDate}</td>
                                <td><span class="badge">${ticket.status}</span></td>
                                <td>
                                    <div class="actions-cell">
                                        <button type="button" class="btn-table-view" onclick="viewTicket('${ticket.pnr}', '${ticket.passengerName}', '${ticket.trainName}', '${ticket.travelDate}', '${ticket.status}')"><i class="fa-solid fa-eye"></i> View</button>
                                        <button type="button" class="btn-table-delete" onclick="deleteTicket('${ticket.pnr}')"><i class="fa-solid fa-trash"></i> Delete</button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <div style="margin-top: 2rem; text-align: right;">
                <button type="button" class="modal-close-btn" onclick="closeTicketsModal()">Close</button>
            </div>
        </div>
    </div>

    
    <div class="modal-overlay" id="singleTicketModal">
        <div class="modal-card" style="max-width: 480px;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem; border-bottom: 1px solid rgba(255, 255, 255, 0.1); padding-bottom: 0.75rem;">
                <h3><i class="fa-solid fa-file-lines" style="color: #cbd5e1;"></i> E-Ticket Details</h3>
                <button type="button" onclick="closeSingleModal()" style="background:none; border:none; color:var(--text-muted); font-size:1.2rem; cursor:pointer;"><i class="fa-solid fa-xmark"></i></button>
            </div>
            <div id="singleModalContent" style="line-height: 1.7; font-size: 1rem; color: var(--text-muted); margin-bottom: 1.5rem;"></div>
            <button type="button" class="modal-close-btn" onclick="closeSingleModal()">Close</button>
        </div>
    </div>

    
    <footer class="trajecto-footer">
        <div class="container footer-content">
            <p>&copy; Built by: Sutanjoy Bhattacharjee</p>
            <div class="social-links">
                <a href="https://www.github.com/sutanjoyb" target="_blank"><i class="fa-brands fa-github"></i></a>
                <a href="https://www.twitter.com/sutanjoyb" target="_blank"><i class="fa-brands fa-twitter"></i></a>
                <a href="https://www.linkedin.com/in/bsutanjoy" target="_blank"><i class="fa-brands fa-linkedin"></i></a>
            </div>
        </div>
    </footer>

    <script>
        window.addEventListener('DOMContentLoaded', () => {
            const banner = document.getElementById('successBanner');
            if (banner) {
                setTimeout(() => {
                    banner.style.opacity = '0';
                    setTimeout(() => banner.remove(), 500);
                }, 4000);
                
                if (window.history.replaceState) {
                    const cleanUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
                    window.history.replaceState({path: cleanUrl}, '', cleanUrl);
                }
            }

            
            document.querySelectorAll('.p-count-badge').forEach(el => {
                const raw = el.getAttribute('data-passengers');
                if (raw) {
                    const list = raw.split(', ');
                    el.innerText = list.length + ' Passenger(s)';
                }
            });
        });

        function goToStep(step) {
            if (step === 2) {
                const source = document.getElementById('sourceInput').value.trim();
                const dest = document.getElementById('destInput').value.trim();
                const dateVal = document.getElementById('dateInput').value;
                if (!source || !dest) { alert('Please enter both source and destination stations.'); return; }
                if (!dateVal) { alert('Please select a travel date.'); return; }
            }
            document.querySelectorAll('.step-container').forEach(el => el.classList.remove('active'));
            document.getElementById('wizard-step-' + step).classList.add('active');
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        function buildPassengerInputs() {
            const count = parseInt(document.getElementById('numPassengers').value) || 1;
            const container = document.getElementById('dynamicPassengerFields');
            container.innerHTML = '';

            for (let i = 0; i < count; i++) {
                container.innerHTML += `
                    <div style="background: rgba(255,255,255,0.04); backdrop-filter: blur(12px); border: 1px solid rgba(255,255,255,0.15); padding: 1.25rem; border-radius: 12px; margin-bottom: 1.25rem; width: 100%;">
                        <div style="font-size: 0.9rem; color: #cbd5e1; font-weight: 600; margin-bottom: 0.75rem;">Passenger \${i + 1}</div>
                        <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                            <div class="form-control-group" style="flex: 2; min-width: 180px; margin-bottom: 0;">
                                <label>Full Name</label>
                                <input type="text" class="p-name" value="" placeholder="Enter Full Name" required>
                            </div>
                            <div class="form-control-group" style="flex: 1; min-width: 70px; margin-bottom: 0;">
                                <label>Age</label>
                                <input type="number" class="p-age" min="1" max="120" placeholder="Age" required>
                            </div>
                            <div class="form-control-group" style="flex: 1; min-width: 100px; margin-bottom: 0;">
                                <label>Gender</label>
                                <select class="p-gender">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="form-control-group" style="flex: 1.5; min-width: 140px; margin-bottom: 0;">
                                <label>Seat Preference</label>
                                <select class="p-seat">
                                    <option value="No Preference">No Preference</option>
                                    <option value="Lower Berth">Lower Berth</option>
                                    <option value="Middle Berth">Middle Berth</option>
                                    <option value="Upper Berth">Upper Berth</option>
                                    <option value="Side Lower">Side Lower</option>
                                    <option value="Side Upper">Side Upper</option>
                                </select>
                            </div>
                        </div>
                    </div>
                `;
            }
            goToStep(3);
        }

        function prepareReview() {
            const names = document.querySelectorAll('.p-name');
            const ages = document.querySelectorAll('.p-age');
            const genders = document.querySelectorAll('.p-gender');
            const seats = document.querySelectorAll('.p-seat');

            for (let i = 0; i < names.length; i++) {
                if (!names[i].value.trim() || !ages[i].value) {
                    alert('Please complete all details for Passenger ' + (i + 1));
                    return;
                }
            }

            let pArray = [];
            let pHtml = '';
            for (let i = 0; i < names.length; i++) {
                let pString = names[i].value.trim() + ' (' + ages[i].value + '/' + genders[i].value + ' | Seat: ' + seats[i].value + ')';
                pArray.push(pString);
                pHtml += '<div style="margin-top: 4px;">• ' + pString + '</div>';
            }

            const source = document.getElementById('sourceInput').value.trim();
            const dest = document.getElementById('destInput').value.trim();
            const trainNameOnly = document.getElementById('trainSelect').value;
            const fullRouteTrain = trainNameOnly + ' (' + source + ' ➔ ' + dest + ')';

            document.getElementById('finalTrainPayload').value = fullRouteTrain;
            document.getElementById('finalDatePayload').value = document.getElementById('dateInput').value;
            document.getElementById('finalPassengerPayload').value = pArray.join(', ');

            document.getElementById('reviewRoute').innerText = source + ' ➔ ' + dest;
            document.getElementById('reviewTrain').innerText = trainNameOnly;
            document.getElementById('reviewDate').innerText = document.getElementById('dateInput').value;
            
            const coach = document.getElementById('coachClass').value;
            document.getElementById('reviewClass').innerText = coach;
            document.getElementById('reviewPassengers').innerHTML = pHtml;

            const rates = { 'General': 350, 'Sleeper': 750, '3AC': 1500, '2AC': 2300, '1AC': 3500 };
            const total = (rates[coach] || 750) * names.length;
            document.getElementById('reviewFare').innerText = '₹' + total.toLocaleString();

            goToStep(4);
        }

        function openTicketsModal() {
            document.getElementById('ticketsModal').style.display = 'flex';
        }

        function closeTicketsModal() {
            document.getElementById('ticketsModal').style.display = 'none';
        }

        function viewTicket(pnr, passengerStr, train, date, status) {
        
            let passengersListHtml = '';
            if (passengerStr) {
                const parts = passengerStr.split(', ');
                parts.forEach((p, idx) => {
                    passengersListHtml += '<div style="margin-top: 4px;">' + (idx + 1) + '. ' + p + '</div>';
                });
            }

            document.getElementById('singleModalContent').innerHTML = `
                <div><strong>PNR Number:</strong> <span style="color:#fff; font-weight:600;">\${pnr}</span></div>
                <div style="margin-top: 0.4rem;"><strong>Train:</strong> \${train}</div>
                <div style="margin-top: 0.4rem;"><strong>Travel Date:</strong> \${date}</div>
                <div style="margin-top: 0.6rem;"><strong>Passenger & Seat Details:</strong><div style="margin-left: 0.5rem; margin-top: 0.2rem;">\${passengersListHtml}</div></div>
                <div style="margin-top: 0.6rem;"><strong>Status:</strong> <span style="color:#34d399; font-weight:600;">\${status}</span></div>
            `;
            document.getElementById('singleTicketModal').style.display = 'flex';
        }

        function closeSingleModal() {
            document.getElementById('singleTicketModal').style.display = 'none';
        }

        function deleteTicket(pnr) {
            if (confirm('Are you sure you want to delete PNR ' + pnr + '?')) {
                fetch('${pageContext.request.contextPath}/delete-ticket', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: 'pnr=' + encodeURIComponent(pnr)
                })
                .then(response => response.text())
                .then(result => {
                    if (result === 'success') {
                        const row = document.getElementById('row-' + pnr);
                        if (row) row.remove();
                        window.location.reload();
                    } else {
                        alert('Failed to delete ticket.');
                    }
                })
                .catch(err => {
                    console.error('Error:', err);
                    alert('An error occurred while deleting.');
                });
            }
        }
    </script>
</body>
</html>