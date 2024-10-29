# Company's Estimated vs. Actual Earnings Tracker

## Overview
This project tracks and compares a company's estimated earnings versus actual earnings, providing interactive visualizations and detailed earnings transcripts for deeper insights.

## Requirements

### Features
- **User Input**: Prompt users to enter a company's stock ticker (e.g., MSFT).
- **API Integration**:
  - Fetch earnings data using the Earnings Calendar API.
  - Retrieve earnings call transcripts for detailed insights.
- **Graphing**: Display a double line graph comparing estimated vs. actual earnings.
- **Interactivity**: Clickable data points to view earnings transcripts.
- **UI Navigation**: Smooth transitions between the graph and the transcript screen.

## Expectations
- **Code Quality**: Maintain clean, well-documented, and maintainable code.
- **State Management**: Efficient handling of app state.
- **Error Handling**: Gracefully manage network requests and API errors.

## Development Steps

1. **Project Setup**: Choose a framework (React Native or Flutter).
2. **Create Input Screen**: Implement an input field for the ticker symbol.
3. **Fetch Data**: Call the Earnings Calendar API and parse the response.
4. **Graph Component**: Use a charting library (e.g., React Native Chart Kit or FlChart) to create the graph.
5. **Interactivity**: Enable data point clicks to fetch transcripts.
6. **Transcript Screen**: Design a screen to display earnings transcripts.

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/Shailandra04/companys-estimated-vs-actual-earnings-tracker.git
   cd companys-estimated-vs-actual-earnings-tracker
2. Install dependencies:
   ```bash
   flutter pub get
3. Run the Application:
   ```bash
   flutter run
  
