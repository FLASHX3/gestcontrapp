<?php
header('Content-Type: application/json');

// Récupérer les données envoyées en POST
$input = json_decode(file_get_contents('php://input'), true);
$userMessage = $input['message'];
$botResponse = '';

// Logique simple pour répondre aux messages
if (strpos(strtolower($userMessage), 'bonjour') !== false) {
    $botResponse = 'Hi there! How can I help you today?';
} else {
    $botResponse = "I'm not sure I understand. Can you please rephrase?";
}

echo json_encode(['response' => $botResponse]);
