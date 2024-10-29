Company's Estimated vs. Actual Earnings Tracker
Overview
This project allows users to track and compare a company's estimated earnings versus actual earnings. It provides interactive visualizations and detailed earnings transcripts for enhanced insights.

Requirements
User Input
Company Ticker: The app prompts users to enter a company's stock ticker (e.g., MSFT for Microsoft).
API Calls
Earnings Data: Utilize the Earnings Calendar API to retrieve earnings data.
Earnings Transcript: For each quarterly earnings data point, fetch detailed transcripts using the Earnings Call Transcript API.
Graphing
Visualization: Display a double line graph to represent estimated vs. actual earnings.
Interactivity
Users can click on data points in the graph to open a new screen with the earnings transcript for that specific quarter.
UI and Navigation
Ensure smooth transitions between the graph and the transcript screen for a seamless user experience.
Expectations
Code Quality and Architecture
Maintain clean, well-documented, and maintainable code throughout the project.
State Management
Efficiently handle the application state to ensure optimal performance and responsiveness.
API Integration and Error Handling
Manage network requests and handle potential API errors gracefully.
Development Steps
1. Project Setup
Choose a framework (e.g., React Native or Flutter).
2. Create Input Screen
Implement a search bar or input field for users to enter the ticker symbol.
3. Fetch and Display Data
Call the Earnings Calendar API to retrieve earnings data.
Parse the API response and organize data for graphing.
4. Graph Component
Use a charting library (e.g., React Native Chart Kit for React Native or FlChart for Flutter) to create a double line graph.
Display estimated vs. actual earnings on the graph.
5. Add Interactivity
Enable clicking on data points in the graph to trigger another API call to fetch the corresponding earnings transcript.
6. Transcript Screen
Design a new screen to display the earnings transcript clearly and informatively.
Getting Started
Clone the repository:

bash
Copy code
git clone https://github.com/Shailandra04/companys-estimated-vs-actual-earnings-tracker.git
cd companys-estimated-vs-actual-earnings-tracker
Install dependencies:

For React Native:
bash
Copy code
npm install
For Flutter:
bash
Copy code
flutter pub get
Run the application:

For React Native:
bash
Copy code
npm start
For Flutter:
bash
Copy code
flutter run
Contributing
Contributions are welcome! Please submit a pull request or open an issue for any suggestions or improvements.
