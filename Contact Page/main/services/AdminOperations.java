package services;

import java.util.List;
import model.contactmodel;

public interface AdminOperations {

    // Admin operations
    List<contactmodel> getAllMessages();        // Get all contact messages
    List<contactmodel> getFaqMessages();        // Get only FAQ-marked messages
    void updateReply(int id, String reply);     // Admin adds reply
    void markAsFaq(int id);                     // Move message to FAQ
    void deleteById(int id);                 // Delete a message
    void unmarkAsFaq(int id);                 // Remove message from FAQ only
}

