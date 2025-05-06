<h1>AniProject</h1>

<h2>Objective</h2>
<p>
  AniProject demonstrates the integration of <strong>Apollo</strong> for GraphQL, 
  <strong>SwiftUI</strong> for building declarative UIs, and <strong>Combine</strong> 
  for reactive programming. It follows the <strong>MVVM-C</strong> architecture and 
  leverages modern Swift concurrency tools to ensure scalability and maintainability.
</p>

<h2>Technologies</h2>
<ul>
  <li><strong>SwiftUI</strong> – Declarative UI framework by Apple</li>
  <li><strong>Combine</strong> – Framework for handling asynchronous events and data streams</li>
  <li><strong>Apollo</strong> – GraphQL client for iOS, used for querying the AniList API</li>
  <li><strong>SwiftLint</strong> – Code style linter to enforce Swift conventions</li>
  <li><strong>Swift Package Manager</strong> – Dependency management</li>
</ul>

<h2>Architecture</h2>
<ul>
  <li><strong>MVVM-C</strong> – A modular architecture pattern:</li>
  <ul>
    <li><strong>Model</strong>: Data and business logic</li>
    <li><strong>View</strong>: User interface</li>
    <li><strong>ViewModel</strong>: Binds the model and view</li>
    <li><strong>Coordinator</strong>: Handles navigation flow</li>
  </ul>
</ul>

<h2>Points of Interest</h2>
<ul>
  <li>
    <strong>GraphQL Integration with Apollo:</strong> 
    The project uses Apollo Codegen to generate Swift types and operations from the AniList GraphQL schema. This ensures type safety and simplifies query handling.
  </li>
  <li>
    <strong>Asynchronous Data Handling:</strong> 
    Combines Swift Concurrency (async/await) with Combine to manage asynchronous data flows efficiently and reactively.
  </li>
  <li>
    <strong>Modular MVVM-C Architecture:</strong> 
    The MVVM-C pattern improves code separation and testability. Coordinators handle navigation independently of UI logic.
  </li>
  <li>
    <strong>Scalable Design:</strong> 
    Designed to be extensible for future features such as favorites, or offline caching.
  </li>
  <li>
    <strong>Code Quality:</strong> 
    SwiftLint is integrated into the development process to maintain consistent code style and catch potential issues early.
  </li>
</ul>

