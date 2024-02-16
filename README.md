# Clinic Service System

## Project Created as a Side Project during the Flutter Experience Event
This project was developed as a side project during the Flutter Experience event and is composed of three main components designed to enhance customer service in a medical clinic setting:

1. Self Service: Enables users to input their personal information and upload necessary documents.
2. Attendant System: Allows attendants to access and view customer information.
3. TV System: Displays the queue, showing customers who are waiting for service.

## Technical Information
Within the repository, a library has been created to serve as the "core" of the system. This core contains shared code between the applications, including communication patterns among layers, an interface for HTTP connection, theme configuration for the design, as well as various helper constants.

- Core Library: A centralized library for shared code, facilitating common functionalities across different parts of the system.
- Websocket Communication: Future updates will include the use of websocket for real-time communication between different components of the system.
- State Management: The project uses [Signals](https://pub.dev/packages/signals) for state management, ensuring efficient and scalable management of UI states.
- Mock API: As this project is not initially intended for a real client (though open to future possibilities), a mock API provided by [Json Rest Server](https://pub.dev/packages/json_rest_server) is used for development and testing purposes.
- Dependence Injection and modules: The project use [Flutter Get It](https://pub.dev/packages/flutter_getit) to manage dependence injection and modules creation


## Project Background
This project was inspired by the Flutter Experience, led by Rodrigo Rahman. It is being developed in tandem with the concepts and techniques presented by him, while also incorporating my own ideas and contributions.

