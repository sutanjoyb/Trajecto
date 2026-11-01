package com.example.demo.service;

import com.example.demo.model.Ticket;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Service
public class TicketService {

    private List<UserTicketRecord> ticketDatabase = new ArrayList<>();

    public static class UserTicketRecord {
        String userEmail;
        Ticket ticket;

        public UserTicketRecord(String userEmail, Ticket ticket) {
            this.userEmail = userEmail;
            this.ticket = ticket;
        }
    }

    public Ticket bookTicket(String userEmail, String passengerName, String trainName, String travelDate) {
        String pnr = "TR" + (100000 + new Random().nextInt(900000));
        Ticket newTicket = new Ticket(pnr, passengerName, trainName, travelDate, "CONFIRMED");
        ticketDatabase.add(new UserTicketRecord(userEmail, newTicket));
        return newTicket;
    }

    public List<Ticket> getTicketsForUser(String userEmail) {
        if (userEmail == null)
            return new ArrayList<>();
        return ticketDatabase.stream()
                .filter(record -> record.userEmail.equalsIgnoreCase(userEmail))
                .map(record -> record.ticket)
                .collect(Collectors.toList());
    }

    public void deleteTicket(String userEmail, String pnr) {
        ticketDatabase
                .removeIf(record -> record.userEmail.equalsIgnoreCase(userEmail) && record.ticket.getPnr().equals(pnr));
    }
}