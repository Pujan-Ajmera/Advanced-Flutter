class QuizData {
  // Your JSON data converted to Dart
  static const List<Map<String, dynamic>> quizTopics = [
    // {
    //   "name": "React Fundamentals",
    //   "data": [
    //     {
    //       "question": "What is the correct way to create a React component?",
    //       "options": [
    //         "function MyComponent() { return <div>Hello</div>; }",
    //         "class MyComponent extends React.Component { render() { return <div>Hello</div>; } }",
    //         "const MyComponent = () => <div>Hello</div>;",
    //         "All of the above",
    //       ],
    //       "answer": "All of the above",
    //     },
    //     {
    //       "question": "What is JSX?",
    //       "options": [
    //         "A JavaScript extension that allows HTML-like syntax",
    //         "A templating language separate from JavaScript",
    //         "A CSS preprocessor",
    //         "A state management library",
    //       ],
    //       "answer": "A JavaScript extension that allows HTML-like syntax",
    //     },
    //     {
    //       "question": "What is the purpose of React hooks?",
    //       "options": [
    //         "To handle CSS styling in components",
    //         "To add state and lifecycle features to functional components",
    //         "To create custom HTML elements",
    //         "To manage routing in React applications",
    //       ],
    //       "answer":
    //           "To add state and lifecycle features to functional components",
    //     },
    //     {
    //       "question":
    //           "Which hook is used for side effects in functional components?",
    //       "options": ["useState", "useEffect", "useContext", "useReducer"],
    //       "answer": "useEffect",
    //     },
    //     {
    //       "question": "What is the virtual DOM in React?",
    //       "options": [
    //         "A lightweight copy of the actual DOM",
    //         "A 3D rendering engine",
    //         "A database for storing component state",
    //         "A browser extension for debugging",
    //       ],
    //       "answer": "A lightweight copy of the actual DOM",
    //     },
    //   ],
    // },
    // {
    //   "name": "Next.js Basics",
    //   "data": [
    //     {
    //       "question": "What is Next.js primarily used for?",
    //       "options": [
    //         "Building static and server-rendered React applications",
    //         "Creating mobile applications",
    //         "Developing desktop software",
    //         "Writing backend services in Python",
    //       ],
    //       "answer": "Building static and server-rendered React applications",
    //     },
    //     {
    //       "question":
    //           "Which file is used as the main entry point in a Next.js application?",
    //       "options": [
    //         "pages/_app.js",
    //         "pages/index.js",
    //         "pages/main.js",
    //         "pages/app.js",
    //       ],
    //       "answer": "pages/_app.js",
    //     },
    //     {
    //       "question": "What is the purpose of the pages directory in Next.js?",
    //       "options": [
    //         "To store CSS files",
    //         "To store API routes",
    //         "To automatically create routes based on file structure",
    //         "To store test files",
    //       ],
    //       "answer": "To automatically create routes based on file structure",
    //     },
    //     {
    //       "question": "How does Next.js handle images by default?",
    //       "options": [
    //         "Using the standard HTML img tag",
    //         "Using a custom Image component that optimizes loading",
    //         "It doesn't support images",
    //         "Only through external CDNs",
    //       ],
    //       "answer": "Using a custom Image component that optimizes loading",
    //     },
    //     {
    //       "question": "What is Static Generation in Next.js?",
    //       "options": [
    //         "Generating HTML at build time",
    //         "Generating HTML on each request",
    //         "A CSS preprocessor",
    //         "A state management solution",
    //       ],
    //       "answer": "Generating HTML at build time",
    //     },
    //   ],
    // },
    // {
    //   "name": "Routing System",
    //   "data": [
    //     {
    //       "question": "How does Next.js handle routing by default?",
    //       "options": [
    //         "Through manual configuration in next.config.js",
    //         "Automatically based on the filesystem in the pages directory",
    //         "Through a separate routing configuration file",
    //         "Next.js doesn't support routing",
    //       ],
    //       "answer":
    //           "Automatically based on the filesystem in the pages directory",
    //     },
    //     {
    //       "question":
    //           "What is the correct way to create a nested route in Next.js?",
    //       "options": [
    //         "By creating nested folders in the pages directory",
    //         "By using special route configuration",
    //         "By adding prefixes to filenames",
    //         "Nested routes aren't possible",
    //       ],
    //       "answer": "By creating nested folders in the pages directory",
    //     },
    //     {
    //       "question": "How do you create a dynamic route in Next.js?",
    //       "options": [
    //         "By adding brackets to a page filename, like [id].js",
    //         "By using a special dynamic keyword",
    //         "By configuring next.config.js",
    //         "Dynamic routes aren't possible in Next.js",
    //       ],
    //       "answer": "By adding brackets to a page filename, like [id].js",
    //     },
    //     {
    //       "question": "What is the purpose of the useRouter hook?",
    //       "options": [
    //         "To access the router object in client-side components",
    //         "To configure server-side routing",
    //         "To style navigation elements",
    //         "To create API routes",
    //       ],
    //       "answer": "To access the router object in client-side components",
    //     },
    //     {
    //       "question":
    //           "How do you programmatically navigate between pages in Next.js?",
    //       "options": [
    //         "Using window.location",
    //         "Using the push method from the router object",
    //         "Using the navigate component",
    //         "Using the redirect function",
    //       ],
    //       "answer": "Using the push method from the router object",
    //     },
    //   ],
    // },
    // {
    //   "name": "Flutter Basics",
    //   "data": [
    //     {
    //       "question": "What is Flutter?",
    //       "options": [
    //         "A mobile operating system",
    //         "A cross-platform app development framework",
    //         "A programming language",
    //         "A database management system",
    //       ],
    //       "answer": "A cross-platform app development framework",
    //     },
    //     {
    //       "question":
    //           "Which programming language is primarily used in Flutter?",
    //       "options": ["Java", "Kotlin", "Dart", "Swift"],
    //       "answer": "Dart",
    //     },
    //     {
    //       "question": "What is a Widget in Flutter?",
    //       "options": [
    //         "A small application",
    //         "Everything in Flutter UI is a widget",
    //         "A type of database",
    //         "A debugging tool",
    //       ],
    //       "answer": "Everything in Flutter UI is a widget",
    //     },
    //     {
    //       "question": "Which company developed Flutter?",
    //       "options": ["Microsoft", "Apple", "Google", "Facebook"],
    //       "answer": "Google",
    //     },
    //     {
    //       "question": "What does 'Hot Reload' do in Flutter?",
    //       "options": [
    //         "Restarts the entire application",
    //         "Quickly updates the UI without losing app state",
    //         "Compiles the code to native",
    //         "Clears the cache",
    //       ],
    //       "answer": "Quickly updates the UI without losing app state",
    //     },
    //   ],
    // },
    // {
    //   "name": "JavaScript Essentials",
    //   "data": [
    //     {
    //       "question":
    //           "What is the difference between let and var in JavaScript?",
    //       "options": [
    //         "let has block scope, var has function scope",
    //         "let has function scope, var has block scope",
    //         "There is no difference",
    //         "let is used for constants, var for variables",
    //       ],
    //       "answer": "let has block scope, var has function scope",
    //     },
    //     {
    //       "question": "What is a closure in JavaScript?",
    //       "options": [
    //         "A way to close the browser",
    //         "A function that has access to variables in its outer scope",
    //         "A type of loop",
    //         "A method to delete variables",
    //       ],
    //       "answer":
    //           "A function that has access to variables in its outer scope",
    //     },
    //     {
    //       "question":
    //           "Which method is used to add an element to the end of an array?",
    //       "options": ["push()", "pop()", "shift()", "unshift()"],
    //       "answer": "push()",
    //     },
    //     {
    //       "question": "What does the '===' operator do in JavaScript?",
    //       "options": [
    //         "Checks for equality without type coercion",
    //         "Checks for equality with type coercion",
    //         "Assigns a value",
    //         "Checks if greater than or equal",
    //       ],
    //       "answer": "Checks for equality without type coercion",
    //     },
    //     {
    //       "question": "What is the purpose of async/await in JavaScript?",
    //       "options": [
    //         "To handle asynchronous operations more readable way",
    //         "To create loops",
    //         "To define classes",
    //         "To handle errors",
    //       ],
    //       "answer": "To handle asynchronous operations more readable way",
    //     },
    //   ],
    // },
    // {
    //   "name": "Python Programming",
    //   "data": [
    //     {
    //       "question": "What is Python?",
    //       "options": [
    //         "A snake species",
    //         "A high-level programming language",
    //         "A web browser",
    //         "A database system",
    //       ],
    //       "answer": "A high-level programming language",
    //     },
    //     {
    //       "question":
    //           "Which of the following is a mutable data type in Python?",
    //       "options": ["tuple", "string", "list", "integer"],
    //       "answer": "list",
    //     },
    //     {
    //       "question": "What does PEP 8 refer to?",
    //       "options": [
    //         "Python's style guide",
    //         "Python's version number",
    //         "A Python library",
    //         "Python's error handling",
    //       ],
    //       "answer": "Python's style guide",
    //     },
    //     {
    //       "question": "What is the output of print(type([]))?",
    //       "options": [
    //         "<class 'list'>",
    //         "<class 'array'>",
    //         "<class 'tuple'>",
    //         "<class 'dict'>",
    //       ],
    //       "answer": "<class 'list'>",
    //     },
    //     {
    //       "question": "Which keyword is used to define a function in Python?",
    //       "options": ["function", "def", "define", "func"],
    //       "answer": "def",
    //     },
    //   ],
    // },
    // {
    //   "name": "CSS Fundamentals",
    //   "data": [
    //     {
    //       "question": "What does CSS stand for?",
    //       "options": [
    //         "Cascading Style Sheets",
    //         "Creative Style Sheets",
    //         "Computer Style Sheets",
    //         "Colorful Style Sheets",
    //       ],
    //       "answer": "Cascading Style Sheets",
    //     },
    //     {
    //       "question": "Which property is used to change the background color?",
    //       "options": [
    //         "background-color",
    //         "bg-color",
    //         "color-background",
    //         "background",
    //       ],
    //       "answer": "background-color",
    //     },
    //     {
    //       "question": "What is the correct CSS syntax for flexbox?",
    //       "options": [
    //         "display: flex",
    //         "display: flexbox",
    //         "flex: display",
    //         "flexbox: true",
    //       ],
    //       "answer": "display: flex",
    //     },
    //     {
    //       "question":
    //           "Which CSS property controls the spacing between elements?",
    //       "options": ["margin", "padding", "spacing", "gap"],
    //       "answer": "margin",
    //     },
    //     {
    //       "question": "What is the CSS box model?",
    //       "options": [
    //         "A way to define content, padding, border, and margin",
    //         "A method to create animations",
    //         "A tool for responsive design",
    //         "A CSS framework",
    //       ],
    //       "answer": "A way to define content, padding, border, and margin",
    //     },
    //   ],
    // },
    // {
    //   "name": "HTML Basics",
    //   "data": [
    //     {
    //       "question": "What does HTML stand for?",
    //       "options": [
    //         "HyperText Markup Language",
    //         "High Tech Modern Language",
    //         "Home Tool Markup Language",
    //         "Hyperlink and Text Markup Language",
    //       ],
    //       "answer": "HyperText Markup Language",
    //     },
    //     {
    //       "question": "Which HTML element is used for the largest heading?",
    //       "options": ["<h1>", "<h6>", "<heading>", "<header>"],
    //       "answer": "<h1>",
    //     },
    //     {
    //       "question":
    //           "What is the correct HTML element for inserting a line break?",
    //       "options": ["<br>", "<lb>", "<break>", "<newline>"],
    //       "answer": "<br>",
    //     },
    //     {
    //       "question":
    //           "Which attribute specifies the URL of the page the link goes to?",
    //       "options": ["href", "src", "link", "url"],
    //       "answer": "href",
    //     },
    //     {
    //       "question": "What is the purpose of the <meta> tag?",
    //       "options": [
    //         "To provide metadata about the HTML document",
    //         "To create navigation menus",
    //         "To display images",
    //         "To add JavaScript code",
    //       ],
    //       "answer": "To provide metadata about the HTML document",
    //     },
    //   ],
    // },
    // {
    //   "name": "Node.js Development",
    //   "data": [
    //     {
    //       "question": "What is Node.js?",
    //       "options": [
    //         "A JavaScript runtime built on Chrome's V8 engine",
    //         "A web framework",
    //         "A database system",
    //         "A CSS preprocessor",
    //       ],
    //       "answer": "A JavaScript runtime built on Chrome's V8 engine",
    //     },
    //     {
    //       "question": "Which command is used to install packages in Node.js?",
    //       "options": [
    //         "npm install",
    //         "node install",
    //         "package install",
    //         "install npm",
    //       ],
    //       "answer": "npm install",
    //     },
    //     {
    //       "question": "What is Express.js?",
    //       "options": [
    //         "A web application framework for Node.js",
    //         "A database ORM",
    //         "A testing framework",
    //         "A CSS framework",
    //       ],
    //       "answer": "A web application framework for Node.js",
    //     },
    //     {
    //       "question": "Which file contains project dependencies in Node.js?",
    //       "options": [
    //         "package.json",
    //         "node.json",
    //         "dependencies.json",
    //         "config.json",
    //       ],
    //       "answer": "package.json",
    //     },
    //     {
    //       "question": "What is middleware in Express.js?",
    //       "options": [
    //         "Functions that execute during the request-response cycle",
    //         "Database connection tools",
    //         "Frontend components",
    //         "Error handling methods",
    //       ],
    //       "answer": "Functions that execute during the request-response cycle",
    //     },
    //   ],
    // },
    // {
    //   "name": "Database Fundamentals",
    //   "data": [
    //     {
    //       "question": "What does SQL stand for?",
    //       "options": [
    //         "Structured Query Language",
    //         "Simple Query Language",
    //         "Standard Query Language",
    //         "Sequential Query Language",
    //       ],
    //       "answer": "Structured Query Language",
    //     },
    //     {
    //       "question":
    //           "Which SQL command is used to retrieve data from a database?",
    //       "options": ["SELECT", "GET", "RETRIEVE", "FETCH"],
    //       "answer": "SELECT",
    //     },
    //     {
    //       "question": "What is a primary key in a database?",
    //       "options": [
    //         "A unique identifier for each record in a table",
    //         "The first column in a table",
    //         "A password for database access",
    //         "The most important data in a table",
    //       ],
    //       "answer": "A unique identifier for each record in a table",
    //     },
    //     {
    //       "question": "What is the difference between SQL and NoSQL databases?",
    //       "options": [
    //         "SQL uses structured data, NoSQL uses unstructured data",
    //         "SQL is faster than NoSQL",
    //         "NoSQL is older than SQL",
    //         "There is no difference",
    //       ],
    //       "answer": "SQL uses structured data, NoSQL uses unstructured data",
    //     },
    //     {
    //       "question": "What is normalization in databases?",
    //       "options": [
    //         "Organizing data to reduce redundancy",
    //         "Adding more data to tables",
    //         "Creating backup copies",
    //         "Encrypting sensitive data",
    //       ],
    //       "answer": "Organizing data to reduce redundancy",
    //     },
    //   ],
    // },
    // {
    //   "name": "Git & Version Control",
    //   "data": [
    //     {
    //       "question": "What is Git?",
    //       "options": [
    //         "A distributed version control system",
    //         "A programming language",
    //         "A web browser",
    //         "A database system",
    //       ],
    //       "answer": "A distributed version control system",
    //     },
    //     {
    //       "question": "Which command is used to clone a repository?",
    //       "options": ["git clone", "git copy", "git download", "git get"],
    //       "answer": "git clone",
    //     },
    //     {
    //       "question": "What does 'git commit' do?",
    //       "options": [
    //         "Saves changes to the local repository",
    //         "Uploads changes to remote repository",
    //         "Downloads latest changes",
    //         "Deletes the repository",
    //       ],
    //       "answer": "Saves changes to the local repository",
    //     },
    //     {
    //       "question": "What is a branch in Git?",
    //       "options": [
    //         "A parallel version of the repository",
    //         "A type of commit message",
    //         "A remote repository",
    //         "A merge conflict",
    //       ],
    //       "answer": "A parallel version of the repository",
    //     },
    //     {
    //       "question": "Which command shows the status of working directory?",
    //       "options": ["git status", "git info", "git check", "git state"],
    //       "answer": "git status",
    //     },
    //   ],
    // },
    // {
    //   "name": "Real-time Features",
    //   "data": [
    //     {
    //       "question": "What is WebSocket used for in real-time applications?",
    //       "options": [
    //         "Full-duplex communication over a single TCP connection",
    //         "Only for file downloads",
    //         "Database transactions",
    //         "Static content serving",
    //       ],
    //       "answer": "Full-duplex communication over a single TCP connection",
    //     },
    //     {
    //       "question":
    //           "Which protocol is commonly used for real-time messaging?",
    //       "options": ["WebRTC", "HTTP/2", "WebSocket", "All of the above"],
    //       "answer": "All of the above",
    //     },
    //     {
    //       "question": "What is Socket.io primarily used for?",
    //       "options": [
    //         "Real-time bidirectional event-based communication",
    //         "File compression",
    //         "Image processing",
    //         "Database management",
    //       ],
    //       "answer": "Real-time bidirectional event-based communication",
    //     },
    //     {
    //       "question":
    //           "What is the purpose of polling in real-time applications?",
    //       "options": [
    //         "To periodically check for updates from the server",
    //         "To reduce server load",
    //         "To encrypt data",
    //         "To compress files",
    //       ],
    //       "answer": "To periodically check for updates from the server",
    //     },
    //     {
    //       "question":
    //           "Which is more efficient for real-time updates: long polling or WebSockets?",
    //       "options": [
    //         "WebSockets for continuous communication",
    //         "Long polling is always better",
    //         "They are equally efficient",
    //         "Neither is suitable for real-time",
    //       ],
    //       "answer": "WebSockets for continuous communication",
    //     },
    //   ],
    // },
    // {
    //   "name": "API Development",
    //   "data": [
    //     {
    //       "question": "What does REST stand for?",
    //       "options": [
    //         "Representational State Transfer",
    //         "Remote Execution Service Transfer",
    //         "Rapid Event Service Transfer",
    //         "Resource State Transaction",
    //       ],
    //       "answer": "Representational State Transfer",
    //     },
    //     {
    //       "question": "Which HTTP method is used to create a new resource?",
    //       "options": ["POST", "GET", "PUT", "DELETE"],
    //       "answer": "POST",
    //     },
    //     {
    //       "question": "What is the purpose of HTTP status code 404?",
    //       "options": [
    //         "Resource not found",
    //         "Server error",
    //         "Successful request",
    //         "Unauthorized access",
    //       ],
    //       "answer": "Resource not found",
    //     },
    //     {
    //       "question": "What is GraphQL?",
    //       "options": [
    //         "A query language for APIs",
    //         "A database system",
    //         "A programming language",
    //         "A web framework",
    //       ],
    //       "answer": "A query language for APIs",
    //     },
    //     {
    //       "question": "Which header is used for API authentication?",
    //       "options": ["Authorization", "Content-Type", "Accept", "User-Agent"],
    //       "answer": "Authorization",
    //     },
    //   ],
    // },
    // {
    //   "name": "Mobile Development",
    //   "data": [
    //     {
    //       "question": "What is React Native?",
    //       "options": [
    //         "A framework for building mobile apps using React",
    //         "A database for mobile apps",
    //         "A testing framework",
    //         "A deployment tool",
    //       ],
    //       "answer": "A framework for building mobile apps using React",
    //     },
    //     {
    //       "question": "Which language is used for iOS native development?",
    //       "options": ["Swift", "Java", "Python", "JavaScript"],
    //       "answer": "Swift",
    //     },
    //     {
    //       "question": "What is Xamarin?",
    //       "options": [
    //         "A cross-platform mobile development framework",
    //         "A mobile testing tool",
    //         "A mobile analytics platform",
    //         "A mobile payment system",
    //       ],
    //       "answer": "A cross-platform mobile development framework",
    //     },
    //     {
    //       "question": "Which file format is used for Android app packages?",
    //       "options": [".apk", ".ipa", ".exe", ".dmg"],
    //       "answer": ".apk",
    //     },
    //     {
    //       "question":
    //           "What is the difference between hot reload and hot restart in Flutter?",
    //       "options": [
    //         "Hot reload preserves state, hot restart resets the app",
    //         "They are the same thing",
    //         "Hot restart is faster",
    //         "Hot reload only works in debug mode",
    //       ],
    //       "answer": "Hot reload preserves state, hot restart resets the app",
    //     },
    //   ],
    // },
    // {
    //   "name": "Web Security",
    //   "data": [
    //     {
    //       "question": "What does HTTPS provide?",
    //       "options": [
    //         "Encryption and authentication",
    //         "Faster loading times",
    //         "Better SEO ranking",
    //         "Automatic caching",
    //       ],
    //       "answer": "Encryption and authentication",
    //     },
    //     {
    //       "question": "What is Cross-Site Scripting (XSS)?",
    //       "options": [
    //         "Injecting malicious scripts into web pages",
    //         "A legitimate web development technique",
    //         "A type of CSS styling",
    //         "A JavaScript framework",
    //       ],
    //       "answer": "Injecting malicious scripts into web pages",
    //     },
    //     {
    //       "question": "What is CORS?",
    //       "options": [
    //         "Cross-Origin Resource Sharing",
    //         "Content Organization and Resource System",
    //         "Cascading Object Resource Sharing",
    //         "Cross-Origin Request Security",
    //       ],
    //       "answer": "Cross-Origin Resource Sharing",
    //     },
    //     {
    //       "question": "What is JWT used for?",
    //       "options": [
    //         "Authentication and information exchange",
    //         "Database management",
    //         "File compression",
    //         "Image processing",
    //       ],
    //       "answer": "Authentication and information exchange",
    //     },
    //     {
    //       "question": "What does SQL injection exploit?",
    //       "options": [
    //         "Unsanitized database queries",
    //         "Network protocols",
    //         "File systems",
    //         "Memory management",
    //       ],
    //       "answer": "Unsanitized database queries",
    //     },
    //   ],
    // },
    // {
    //   "name": "Cloud Computing",
    //   "data": [
    //     {
    //       "question": "What is AWS?",
    //       "options": [
    //         "Amazon Web Services",
    //         "Advanced Web Security",
    //         "Automated Website System",
    //         "Application Web Server",
    //       ],
    //       "answer": "Amazon Web Services",
    //     },
    //     {
    //       "question": "What is serverless computing?",
    //       "options": [
    //         "Running code without managing servers",
    //         "Computing without internet",
    //         "Using only local servers",
    //         "Computing without electricity",
    //       ],
    //       "answer": "Running code without managing servers",
    //     },
    //     {
    //       "question": "What is Docker?",
    //       "options": [
    //         "A containerization platform",
    //         "A database system",
    //         "A programming language",
    //         "A web browser",
    //       ],
    //       "answer": "A containerization platform",
    //     },
    //     {
    //       "question": "What is Kubernetes?",
    //       "options": [
    //         "Container orchestration platform",
    //         "Database management system",
    //         "Programming language",
    //         "Text editor",
    //       ],
    //       "answer": "Container orchestration platform",
    //     },
    //     {
    //       "question": "What is Infrastructure as Code (IaC)?",
    //       "options": [
    //         "Managing infrastructure through code",
    //         "Writing code for applications",
    //         "Building physical servers",
    //         "Creating user interfaces",
    //       ],
    //       "answer": "Managing infrastructure through code",
    //     },
    //   ],
    // },
      {
        "name": "React Fundamentals",
        "data": [
          {
            "question": "What is the correct way to create a React component?",
            "options": [
              "function MyComponent() { return <div>Hello</div>; }",
              "class MyComponent extends React.Component { render() { return <div>Hello</div>; } }",
              "const MyComponent = () => <div>Hello</div>;",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is JSX?",
            "options": [
              "A JavaScript extension that allows HTML-like syntax",
              "A templating language separate from JavaScript",
              "A CSS preprocessor",
              "A state management library"
            ],
            "answer": "A JavaScript extension that allows HTML-like syntax"
          },
          {
            "question": "What is the purpose of React hooks?",
            "options": [
              "To handle CSS styling in components",
              "To add state and lifecycle features to functional components",
              "To create custom HTML elements",
              "To manage routing in React applications"
            ],
            "answer": "To add state and lifecycle features to functional components"
          },
          {
            "question": "Which hook is used for side effects in functional components?",
            "options": [
              "useState",
              "useEffect",
              "useContext",
              "useReducer"
            ],
            "answer": "useEffect"
          },
          {
            "question": "What is the virtual DOM in React?",
            "options": [
              "A lightweight copy of the actual DOM",
              "A 3D rendering engine",
              "A database for storing component state",
              "A browser extension for debugging"
            ],
            "answer": "A lightweight copy of the actual DOM"
          },
          {
            "question": "How do you pass data from parent to child component?",
            "options": [
              "Using state management libraries",
              "Through props",
              "Using context API",
              "All of the above"
            ],
            "answer": "Through props"
          },
          {
            "question": "What is the purpose of keys in React lists?",
            "options": [
              "To provide unique identifiers for list items",
              "To encrypt component data",
              "To style list items differently",
              "To sort the list automatically"
            ],
            "answer": "To provide unique identifiers for list items"
          },
          {
            "question": "Which method is called after a component is rendered for the first time?",
            "options": [
              "componentWillMount",
              "componentDidMount",
              "componentWillUpdate",
              "componentDidUpdate"
            ],
            "answer": "componentDidMount"
          },
          {
            "question": "What is the correct way to update state in a class component?",
            "options": [
              "this.state.count = 1",
              "this.setState({ count: 1 })",
              "setState({ count: 1 })",
              "state = { count: 1 }"
            ],
            "answer": "this.setState({ count: 1 })"
          },
          {
            "question": "What is prop drilling in React?",
            "options": [
              "The process of passing props through multiple layers of components",
              "A performance optimization technique",
              "A way to validate props",
              "A method for styling components"
            ],
            "answer": "The process of passing props through multiple layers of components"
          },
          {
            "question": "Which tool can help avoid prop drilling?",
            "options": [
              "Context API",
              "Redux",
              "Both A and B",
              "Neither A nor B"
            ],
            "answer": "Both A and B"
          },
          {
            "question": "What is the purpose of React.Fragment?",
            "options": [
              "To group multiple elements without adding extra nodes to the DOM",
              "To create reusable component templates",
              "To handle form submissions",
              "To manage component state"
            ],
            "answer": "To group multiple elements without adding extra nodes to the DOM"
          },
          {
            "question": "What is the difference between controlled and uncontrolled components?",
            "options": [
              "Controlled components manage their own state, uncontrolled don't",
              "Uncontrolled components manage their own state, controlled don't",
              "There is no difference",
              "Controlled components are class components, uncontrolled are functional"
            ],
            "answer": "Uncontrolled components manage their own state, controlled don't"
          },
          {
            "question": "What is the purpose of React.memo?",
            "options": [
              "To memoize expensive calculations",
              "To optimize performance by preventing unnecessary re-renders",
              "To manage component state",
              "To handle side effects"
            ],
            "answer": "To optimize performance by preventing unnecessary re-renders"
          },
          {
            "question": "Which lifecycle method is used for cleanup in class components?",
            "options": [
              "componentWillUnmount",
              "componentDidMount",
              "componentDidUpdate",
              "shouldComponentUpdate"
            ],
            "answer": "componentWillUnmount"
          }
        ]
      },
      {
        "name": "Next.js Basics",
        "data": [
          {
            "question": "What is Next.js primarily used for?",
            "options": [
              "Building static and server-rendered React applications",
              "Creating mobile applications",
              "Developing desktop software",
              "Writing backend services in Python"
            ],
            "answer": "Building static and server-rendered React applications"
          },
          {
            "question": "Which file is used as the main entry point in a Next.js application?",
            "options": [
              "pages/_app.js",
              "pages/index.js",
              "pages/main.js",
              "pages/app.js"
            ],
            "answer": "pages/_app.js"
          },
          {
            "question": "What is the purpose of the pages directory in Next.js?",
            "options": [
              "To store CSS files",
              "To store API routes",
              "To automatically create routes based on file structure",
              "To store test files"
            ],
            "answer": "To automatically create routes based on file structure"
          },
          {
            "question": "How does Next.js handle images by default?",
            "options": [
              "Using the standard HTML img tag",
              "Using a custom Image component that optimizes loading",
              "It doesn't support images",
              "Only through external CDNs"
            ],
            "answer": "Using a custom Image component that optimizes loading"
          },
          {
            "question": "What is Static Generation in Next.js?",
            "options": [
              "Generating HTML at build time",
              "Generating HTML on each request",
              "A CSS preprocessor",
              "A state management solution"
            ],
            "answer": "Generating HTML at build time"
          },
          {
            "question": "What is Server-side Rendering in Next.js?",
            "options": [
              "Generating HTML on the client side",
              "Generating HTML on the server for each request",
              "A database query technique",
              "A way to style components"
            ],
            "answer": "Generating HTML on the server for each request"
          },
          {
            "question": "Which command is used to start a Next.js development server?",
            "options": [
              "npm start",
              "npm run dev",
              "next start",
              "Both B and C"
            ],
            "answer": "Both B and C"
          },
          {
            "question": "What is the purpose of next.config.js?",
            "options": [
              "To configure build settings for Next.js",
              "To store environment variables",
              "To define API routes",
              "To style components"
            ],
            "answer": "To configure build settings for Next.js"
          },
          {
            "question": "How do you create a dynamic route in Next.js?",
            "options": [
              "By adding brackets to a page filename, like [id].js",
              "By using a special dynamic keyword",
              "By configuring next.config.js",
              "Dynamic routes aren't possible in Next.js"
            ],
            "answer": "By adding brackets to a page filename, like [id].js"
          },
          {
            "question": "What is the purpose of getStaticProps?",
            "options": [
              "To fetch data at build time for static generation",
              "To handle form submissions",
              "To manage component state",
              "To style components"
            ],
            "answer": "To fetch data at build time for static generation"
          },
          {
            "question": "What is the purpose of getServerSideProps?",
            "options": [
              "To fetch data on each request for server-side rendering",
              "To handle client-side state",
              "To configure the server",
              "To create API routes"
            ],
            "answer": "To fetch data on each request for server-side rendering"
          },
          {
            "question": "How do you add global CSS in Next.js?",
            "options": [
              "By importing it in pages/_app.js",
              "By adding it to next.config.js",
              "By including it in each component",
              "Global CSS isn't supported in Next.js"
            ],
            "answer": "By importing it in pages/_app.js"
          },
          {
            "question": "What is the purpose of the public directory in Next.js?",
            "options": [
              "To store static files that are served at the root path",
              "To store server-side code",
              "To store API routes",
              "To store test files"
            ],
            "answer": "To store static files that are served at the root path"
          },
          {
            "question": "How does Next.js handle TypeScript support?",
            "options": [
              "Through manual configuration only",
              "It has built-in TypeScript support with zero configuration",
              "TypeScript isn't supported",
              "Only through external plugins"
            ],
            "answer": "It has built-in TypeScript support with zero configuration"
          },
          {
            "question": "What is the purpose of next/link?",
            "options": [
              "To handle client-side navigation between pages",
              "To create external links",
              "To manage API connections",
              "To style navigation elements"
            ],
            "answer": "To handle client-side navigation between pages"
          }
        ]
      },
      {
        "name": "Routing System",
        "data": [
          {
            "question": "How does Next.js handle routing by default?",
            "options": [
              "Through manual configuration in next.config.js",
              "Automatically based on the filesystem in the pages directory",
              "Through a separate routing configuration file",
              "Next.js doesn't support routing"
            ],
            "answer": "Automatically based on the filesystem in the pages directory"
          },
          {
            "question": "What is the correct way to create a nested route in Next.js?",
            "options": [
              "By creating nested folders in the pages directory",
              "By using special route configuration",
              "By adding prefixes to filenames",
              "Nested routes aren't possible"
            ],
            "answer": "By creating nested folders in the pages directory"
          },
          {
            "question": "How do you create a dynamic route in Next.js?",
            "options": [
              "By adding brackets to a page filename, like [id].js",
              "By using a special dynamic keyword",
              "By configuring next.config.js",
              "Dynamic routes aren't possible in Next.js"
            ],
            "answer": "By adding brackets to a page filename, like [id].js"
          },
          {
            "question": "What is the purpose of the useRouter hook?",
            "options": [
              "To access the router object in client-side components",
              "To configure server-side routing",
              "To style navigation elements",
              "To create API routes"
            ],
            "answer": "To access the router object in client-side components"
          },
          {
            "question": "How do you programmatically navigate between pages in Next.js?",
            "options": [
              "Using window.location",
              "Using the push method from the router object",
              "Using the navigate component",
              "Using the redirect function"
            ],
            "answer": "Using the push method from the router object"
          },
          {
            "question": "What is the purpose of the as prop in next/link?",
            "options": [
              "To style the link",
              "To specify how the URL appears in the browser",
              "To add accessibility attributes",
              "To define the link's target"
            ],
            "answer": "To specify how the URL appears in the browser"
          },
          {
            "question": "How do you catch all routes in Next.js?",
            "options": [
              "By creating a file named [...all].js",
              "By using a wildcard in next.config.js",
              "By creating a file named [...slug].js",
              "By using a special catchAll prop"
            ],
            "answer": "By creating a file named [...slug].js"
          },
          {
            "question": "What is the purpose of shallow routing in Next.js?",
            "options": [
              "To change the URL without running data fetching methods",
              "To create simple routes",
              "To handle nested routes",
              "To optimize performance"
            ],
            "answer": "To change the URL without running data fetching methods"
          },
          {
            "question": "How do you access query parameters in a Next.js page?",
            "options": [
              "Through the router.query object",
              "By parsing window.location.search",
              "Through special props passed to the page",
              "By using the useParams hook"
            ],
            "answer": "Through the router.query object"
          },
          {
            "question": "What is the purpose of the _app.js file in Next.js routing?",
            "options": [
              "To initialize pages and keep state between page navigations",
              "To define API routes",
              "To configure dynamic routes",
              "To handle 404 errors"
            ],
            "answer": "To initialize pages and keep state between page navigations"
          },
          {
            "question": "How do you create a custom 404 page in Next.js?",
            "options": [
              "By creating a file named 404.js in the pages directory",
              "By configuring next.config.js",
              "By using a special Error component",
              "By handling it in _app.js"
            ],
            "answer": "By creating a file named 404.js in the pages directory"
          },
          {
            "question": "What is the purpose of the _document.js file in Next.js?",
            "options": [
              "To augment the application's html and body tags",
              "To handle API documentation",
              "To create dynamic routes",
              "To manage state between pages"
            ],
            "answer": "To augment the application's html and body tags"
          },
          {
            "question": "How do you implement internationalized routing in Next.js?",
            "options": [
              "By manually creating locale-specific routes",
              "Through the built-in i18n routing support",
              "By using third-party libraries only",
              "Internationalized routing isn't possible"
            ],
            "answer": "Through the built-in i18n routing support"
          },
          {
            "question": "What is the purpose of the Link component's passHref prop?",
            "options": [
              "To force the Link to pass its href to the child",
              "To prevent the href from being passed",
              "To style the link differently",
              "To enable prefetching"
            ],
            "answer": "To force the Link to pass its href to the child"
          },
          {
            "question": "How do you prefetch pages in Next.js?",
            "options": [
              "By using the prefetch prop on the Link component",
              "By manually calling a prefetch function",
              "By configuring next.config.js",
              "Prefetching happens automatically for all visible links"
            ],
            "answer": "Prefetching happens automatically for all visible links"
          }
        ]
      },
      {
        "name": "Data Fetching",
        "data": [
          {
            "question": "What are the three data fetching methods in Next.js?",
            "options": [
              "getStaticProps, getServerProps, getClientProps",
              "getStaticProps, getServerSideProps, getStaticPaths",
              "fetchData, loadData, preloadData",
              "useStatic, useServer, useClient"
            ],
            "answer": "getStaticProps, getServerSideProps, getStaticPaths"
          },
          {
            "question": "When should you use getStaticProps?",
            "options": [
              "When data changes frequently",
              "When data can be known at build time",
              "When you need user-specific data",
              "When you need real-time data"
            ],
            "answer": "When data can be known at build time"
          },
          {
            "question": "When should you use getServerSideProps?",
            "options": [
              "When data can be known at build time",
              "When you need to fetch data at request time",
              "When you're creating static pages",
              "When you don't need fresh data"
            ],
            "answer": "When you need to fetch data at request time"
          },
          {
            "question": "What is the purpose of getStaticPaths?",
            "options": [
              "To define dynamic routes for static generation",
              "To handle API routes",
              "To manage client-side state",
              "To style components"
            ],
            "answer": "To define dynamic routes for static generation"
          },
          {
            "question": "What is Incremental Static Regeneration in Next.js?",
            "options": [
              "A way to update static pages after build time",
              "A method for server-side rendering",
              "A CSS optimization technique",
              "A state management solution"
            ],
            "answer": "A way to update static pages after build time"
          },
          {
            "question": "How do you implement ISR (Incremental Static Regeneration)?",
            "options": [
              "By adding the revalidate prop to getStaticProps",
              "By using a special ISR component",
              "By configuring next.config.js",
              "By using getServerSideProps instead"
            ],
            "answer": "By adding the revalidate prop to getStaticProps"
          },
          {
            "question": "What is the purpose of the fallback prop in getStaticPaths?",
            "options": [
              "To show a fallback page while the page is being generated",
              "To handle 404 errors",
              "To style the loading state",
              "To manage API routes"
            ],
            "answer": "To show a fallback page while the page is being generated"
          },
          {
            "question": "How do you fetch data on the client side in Next.js?",
            "options": [
              "Using standard fetch or axios in useEffect",
              "Using getStaticProps on the client",
              "Using getServerSideProps on the client",
              "Client-side data fetching isn't possible"
            ],
            "answer": "Using standard fetch or axios in useEffect"
          },
          {
            "question": "What is SWR in the context of Next.js?",
            "options": [
              "A React hook for client-side data fetching",
              "A server-side rendering technique",
              "A styling solution",
              "A routing library"
            ],
            "answer": "A React hook for client-side data fetching"
          },
          {
            "question": "How do you handle API errors in getStaticProps?",
            "options": [
              "By throwing an error which will result in a 500 page",
              "By returning a notFound: true object",
              "By redirecting to another page",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the difference between getStaticProps and getServerSideProps?",
            "options": [
              "getStaticProps runs at build time, getServerSideProps runs on each request",
              "getStaticProps is for client-side, getServerSideProps is for server-side",
              "There is no difference",
              "getStaticProps is for API routes, getServerSideProps is for pages"
            ],
            "answer": "getStaticProps runs at build time, getServerSideProps runs on each request"
          },
          {
            "question": "How do you access query parameters in getServerSideProps?",
            "options": [
              "Through the context parameter",
              "By using the useRouter hook",
              "By parsing window.location",
              "Query parameters aren't available"
            ],
            "answer": "Through the context parameter"
          },
          {
            "question": "What is the purpose of the notFound return value in getStaticProps?",
            "options": [
              "To return a 404 page",
              "To handle API errors",
              "To redirect to another page",
              "To show a loading state"
            ],
            "answer": "To return a 404 page"
          },
          {
            "question": "How do you redirect in getStaticProps or getServerSideProps?",
            "options": [
              "By returning { redirect: { destination: '/', permanent: false } }",
              "By using the useRouter hook",
              "By throwing a redirect error",
              "By using window.location"
            ],
            "answer": "By returning { redirect: { destination: '/', permanent: false } }"
          },
          {
            "question": "What is the purpose of the context parameter in data fetching methods?",
            "options": [
              "It contains route parameters, req/res objects, and other information",
              "It's used for state management",
              "It handles CSS-in-JS",
              "It's only used for error handling"
            ],
            "answer": "It contains route parameters, req/res objects, and other information"
          }
        ]
      },
      {
        "name": "API Routes",
        "data": [
          {
            "question": "Where do you create API routes in Next.js?",
            "options": [
              "In the pages/api directory",
              "In the public/api directory",
              "In the server directory",
              "In the lib directory"
            ],
            "answer": "In the pages/api directory"
          },
          {
            "question": "How do you access query parameters in an API route?",
            "options": [
              "Through req.query",
              "Through req.params",
              "Through req.body",
              "Through req.url"
            ],
            "answer": "Through req.query"
          },
          {
            "question": "How do you access the HTTP method in an API route?",
            "options": [
              "Through req.method",
              "Through req.httpMethod",
              "Through req.requestMethod",
              "Through req.type"
            ],
            "answer": "Through req.method"
          },
          {
            "question": "What is the correct way to send a JSON response from an API route?",
            "options": [
              "res.json({ data: 'value' })",
              "res.send({ data: 'value' })",
              "res.end(JSON.stringify({ data: 'value' }))",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you handle POST requests in an API route?",
            "options": [
              "By checking req.method === 'POST'",
              "By creating a file named post.js",
              "By using a special POST component",
              "POST requests aren't supported"
            ],
            "answer": "By checking req.method === 'POST'"
          },
          {
            "question": "How do you access the request body in an API route?",
            "options": [
              "Through req.body",
              "Through req.data",
              "Through req.content",
              "Through req.payload"
            ],
            "answer": "Through req.body"
          },
          {
            "question": "What middleware is needed to parse JSON request bodies?",
            "options": [
              "body-parser",
              "express.json()",
              "Next.js includes it by default",
              "No middleware can parse JSON"
            ],
            "answer": "Next.js includes it by default"
          },
          {
            "question": "How do you set HTTP headers in an API route response?",
            "options": [
              "Using res.setHeader()",
              "Using res.headers()",
              "Using res.addHeader()",
              "Headers can't be set in API routes"
            ],
            "answer": "Using res.setHeader()"
          },
          {
            "question": "How do you handle dynamic API routes?",
            "options": [
              "By creating files with brackets like [id].js in pages/api",
              "By using a special dynamic keyword",
              "By configuring next.config.js",
              "Dynamic API routes aren't possible"
            ],
            "answer": "By creating files with brackets like [id].js in pages/api"
          },
          {
            "question": "What is the purpose of the config export in API routes?",
            "options": [
              "To configure body parsing options",
              "To set CORS headers",
              "To disable the default body parser",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you handle CORS in API routes?",
            "options": [
              "By manually setting CORS headers",
              "By using the cors middleware",
              "By configuring next.config.js",
              "CORS is enabled by default"
            ],
            "answer": "By manually setting CORS headers"
          },
          {
            "question": "Can API routes be used with getStaticProps?",
            "options": [
              "Yes, but it's not recommended",
              "No, API routes only work in server-side contexts",
              "Only if they're in the same directory",
              "Only with special configuration"
            ],
            "answer": "Yes, but it's not recommended"
          },
          {
            "question": "How do you handle file uploads in API routes?",
            "options": [
              "By using a library like formidable",
              "By parsing req.files directly",
              "File uploads aren't supported",
              "By using a special upload component"
            ],
            "answer": "By using a library like formidable"
          },
          {
            "question": "What is the correct way to handle errors in API routes?",
            "options": [
              "By returning an error status code and message",
              "By throwing an error",
              "By using try/catch blocks",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you protect API routes with authentication?",
            "options": [
              "By checking authentication in the API route handler",
              "By using middleware functions",
              "By configuring next.config.js",
              "API routes can't be protected"
            ],
            "answer": "By checking authentication in the API route handler"
          }
        ]
      },
      {
        "name": "Styling Solutions",
        "data": [
          {
            "question": "Which CSS-in-JS library comes built-in with Next.js?",
            "options": [
              "Styled-components",
              "Emotion",
              "Styled-jsx",
              "None of the above"
            ],
            "answer": "Styled-jsx"
          },
          {
            "question": "How do you add global CSS in Next.js?",
            "options": [
              "By importing it in pages/_app.js",
              "By adding it to next.config.js",
              "By including it in each component",
              "Global CSS isn't supported"
            ],
            "answer": "By importing it in pages/_app.js"
          },
          {
            "question": "What is CSS Modules support like in Next.js?",
            "options": [
              "Not supported",
              "Supported out of the box",
              "Supported with additional configuration",
              "Only works with TypeScript"
            ],
            "answer": "Supported out of the box"
          },
          {
            "question": "How do you use Sass in Next.js?",
            "options": [
              "By installing sass package",
              "By configuring next.config.js",
              "Both A and B",
              "Sass isn't supported"
            ],
            "answer": "By installing sass package"
          },
          {
            "question": "What is the benefit of using styled-jsx in Next.js?",
            "options": [
              "Scoped CSS by default",
              "Better performance than other solutions",
              "Built-in support without additional configuration",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement dark mode in Next.js?",
            "options": [
              "Using CSS variables and React state",
              "Using a specialized dark mode library",
              "By configuring next.config.js",
              "Dark mode isn't possible"
            ],
            "answer": "Using CSS variables and React state"
          },
          {
            "question": "What is the purpose of next/head?",
            "options": [
              "To add elements to the document head",
              "To handle routing",
              "To manage state",
              "To style components"
            ],
            "answer": "To add elements to the document head"
          },
          {
            "question": "How do you use Tailwind CSS with Next.js?",
            "options": [
              "By installing tailwindcss and configuring PostCSS",
              "By using a CDN link",
              "By extending next.config.js",
              "Tailwind isn't compatible"
            ],
            "answer": "By installing tailwindcss and configuring PostCSS"
          },
          {
            "question": "What is the advantage of CSS Modules?",
            "options": [
              "Locally scoped class names",
              "Automatic vendor prefixing",
              "Built-in Sass-like features",
              "All of the above"
            ],
            "answer": "Locally scoped class names"
          },
          {
            "question": "How do you implement responsive design in Next.js?",
            "options": [
              "Using CSS media queries",
              "Using Tailwind's responsive prefixes",
              "Using styled-jsx media queries",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of the Image component in Next.js?",
            "options": [
              "To optimize image loading",
              "To handle responsive images",
              "To lazy load images",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you add a custom font in Next.js?",
            "options": [
              "Using @font-face in CSS",
              "Using next/font",
              "Using a CDN link in next/head",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of next/font?",
            "options": [
              "To automatically optimize and self-host fonts",
              "To provide a font database",
              "To handle font licensing",
              "To create custom fonts"
            ],
            "answer": "To automatically optimize and self-host fonts"
          },
          {
            "question": "How do you implement CSS animations in Next.js?",
            "options": [
              "Using CSS @keyframes",
              "Using animation libraries",
              "Using Framer Motion",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of using the Image component over img tag?",
            "options": [
              "Automatic optimization",
              "Lazy loading",
              "Responsive sizing",
              "All of the above"
            ],
            "answer": "All of the above"
          }
        ]
      },
      {
        "name": "Performance Optimization",
        "data": [
          {
            "question": "What is automatic static optimization in Next.js?",
            "options": [
              "Pages without getServerSideProps are prerendered as static HTML",
              "Automatic code splitting",
              "Image optimization",
              "CSS minification"
            ],
            "answer": "Pages without getServerSideProps are prerendered as static HTML"
          },
          {
            "question": "What is code splitting in Next.js?",
            "options": [
              "Splitting code into smaller bundles loaded as needed",
              "Dividing code into multiple files",
              "Separating server and client code",
              "Splitting components into smaller pieces"
            ],
            "answer": "Splitting code into smaller bundles loaded as needed"
          },
          {
            "question": "How does Next.js handle lazy loading of components?",
            "options": [
              "Using dynamic imports",
              "Using React.lazy",
              "Automatically for all components",
              "Lazy loading isn't supported"
            ],
            "answer": "Using dynamic imports"
          },
          {
            "question": "What is the purpose of next/dynamic?",
            "options": [
              "To lazy load components",
              "To handle dynamic routes",
              "To manage state",
              "To style components"
            ],
            "answer": "To lazy load components"
          },
          {
            "question": "How do you optimize images in Next.js?",
            "options": [
              "Using the Image component",
              "Manually optimizing before upload",
              "Using a CDN",
              "All of the above"
            ],
            "answer": "Using the Image component"
          },
          {
            "question": "What is Incremental Static Regeneration (ISR)?",
            "options": [
              "Updating static pages after build without rebuilding",
              "Generating static pages on demand",
              "A hybrid of SSR and SSG",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement ISR?",
            "options": [
              "By adding revalidate to getStaticProps",
              "By using getServerSideProps",
              "By configuring next.config.js",
              "By using a special ISR component"
            ],
            "answer": "By adding revalidate to getStaticProps"
          },
          {
            "question": "What is the purpose of next/script?",
            "options": [
              "To optimize third-party scripts loading",
              "To write server scripts",
              "To handle routing",
              "To manage state"
            ],
            "answer": "To optimize third-party scripts loading"
          },
          {
            "question": "How do you analyze bundle size in Next.js?",
            "options": [
              "Using @next/bundle-analyzer",
              "Using webpack-bundle-analyzer",
              "Using built-in Next.js commands",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of static generation?",
            "options": [
              "Better performance as pages are pre-rendered",
              "Lower server load",
              "Better SEO",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement route prefetching in Next.js?",
            "options": [
              "It happens automatically for visible links",
              "Using the prefetch prop on Link",
              "By manually calling router.prefetch",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of next/amp?",
            "options": [
              "To create AMP pages",
              "To optimize performance",
              "To handle analytics",
              "To manage state"
            ],
            "answer": "To create AMP pages"
          },
          {
            "question": "How do you reduce JavaScript bundle size?",
            "options": [
              "Code splitting",
              "Using dynamic imports",
              "Removing unused dependencies",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of React.memo in Next.js?",
            "options": [
              "To prevent unnecessary re-renders",
              "To memoize data fetching",
              "To manage state",
              "To handle routing"
            ],
            "answer": "To prevent unnecessary re-renders"
          },
          {
            "question": "How do you optimize API routes performance?",
            "options": [
              "Adding caching headers",
              "Implementing edge functions",
              "Optimizing database queries",
              "All of the above"
            ],
            "answer": "All of the above"
          }
        ]
      },
      {
        "name": "Authentication",
        "data": [
          {
            "question": "What are common authentication strategies in Next.js?",
            "options": [
              "JWT",
              "Session-based",
              "OAuth",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement JWT authentication in Next.js?",
            "options": [
              "Storing tokens in HTTP-only cookies",
              "Using localStorage",
              "Using sessionStorage",
              "All of the above"
            ],
            "answer": "Storing tokens in HTTP-only cookies"
          },
          {
            "question": "What is the purpose of next-auth?",
            "options": [
              "To simplify authentication implementation",
              "To handle routing",
              "To manage state",
              "To style components"
            ],
            "answer": "To simplify authentication implementation"
          },
          {
            "question": "How do you protect routes in Next.js?",
            "options": [
              "Client-side checks in useEffect",
              "Server-side checks in getServerSideProps",
              "Middleware functions",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of HTTP-only cookies for authentication?",
            "options": [
              "More secure against XSS attacks",
              "Automatically sent with requests",
              "Can be accessed server-side",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement social login in Next.js?",
            "options": [
              "Using next-auth providers",
              "Implementing OAuth flows manually",
              "Using third-party services",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is CSRF protection and how is it implemented?",
            "options": [
              "Protection against cross-site request forgery using tokens",
              "A type of authentication",
              "A performance optimization",
              "A routing technique"
            ],
            "answer": "Protection against cross-site request forgery using tokens"
          },
          {
            "question": "How do you handle user sessions in Next.js?",
            "options": [
              "Using next-auth session management",
              "Implementing custom session logic",
              "Using JWT tokens",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of middleware in authentication?",
            "options": [
              "To protect routes before rendering",
              "To handle styling",
              "To manage state",
              "To optimize performance"
            ],
            "answer": "To protect routes before rendering"
          },
          {
            "question": "How do you implement role-based access control?",
            "options": [
              "By checking user roles in getServerSideProps",
              "Using middleware functions",
              "Client-side checks",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of server-side authentication checks?",
            "options": [
              "More secure as client can't bypass",
              "Better user experience",
              "Easier to implement",
              "Faster performance"
            ],
            "answer": "More secure as client can't bypass"
          },
          {
            "question": "How do you handle authentication state in Next.js?",
            "options": [
              "Using React context",
              "Using state management libraries",
              "Through session cookies",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is passwordless authentication?",
            "options": [
              "Authentication via email links or magic links",
              "No authentication at all",
              "Using biometrics only",
              "A deprecated method"
            ],
            "answer": "Authentication via email links or magic links"
          },
          {
            "question": "How do you implement logout functionality?",
            "options": [
              "Clearing session cookies",
              "Invalidating tokens",
              "Redirecting to login page",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of refresh tokens?",
            "options": [
              "To obtain new access tokens without re-authentication",
              "To improve performance",
              "To handle routing",
              "To manage state"
            ],
            "answer": "To obtain new access tokens without re-authentication"
          }
        ]
      },
      {
        "name": "Database Integration",
        "data": [
          {
            "question": "What databases work well with Next.js?",
            "options": [
              "PostgreSQL",
              "MongoDB",
              "Firebase",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "Where should database queries be made in Next.js?",
            "options": [
              "In API routes",
              "In getServerSideProps",
              "In getStaticProps",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you connect to a database in Next.js?",
            "options": [
              "Using the database's native driver",
              "Using an ORM like Prisma",
              "Using a query builder",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of using an ORM?",
            "options": [
              "Higher level abstraction over raw SQL",
              "Type safety",
              "Database agnostic queries",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you handle database connections efficiently?",
            "options": [
              "Using connection pooling",
              "Creating new connections for each request",
              "Using serverless connections",
              "All of the above"
            ],
            "answer": "Using connection pooling"
          },
          {
            "question": "What is Prisma?",
            "options": [
              "A next-generation ORM",
              "A database",
              "A styling solution",
              "A state management library"
            ],
            "answer": "A next-generation ORM"
          },
          {
            "question": "How do you implement serverless database connections?",
            "options": [
              "Using services like PlanetScale",
              "Using traditional connection pooling",
              "Serverless databases aren't possible",
              "By configuring next.config.js"
            ],
            "answer": "Using services like PlanetScale"
          },
          {
            "question": "What is the benefit of edge-compatible databases?",
            "options": [
              "Lower latency for global applications",
              "Better performance",
              "Easier scaling",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you handle database migrations?",
            "options": [
              "Using ORM migration tools",
              "Manual SQL scripts",
              "Database-specific tools",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is connection pooling?",
            "options": [
              "Reusing database connections to improve performance",
              "A type of database",
              "A security feature",
              "A styling technique"
            ],
            "answer": "Reusing database connections to improve performance"
          },
          {
            "question": "How do you secure database credentials in Next.js?",
            "options": [
              "Using environment variables",
              "Using secret management services",
              "Never committing to version control",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of database transactions?",
            "options": [
              "To group operations that should succeed or fail together",
              "To improve performance",
              "To handle routing",
              "To manage state"
            ],
            "answer": "To group operations that should succeed or fail together"
          },
          {
            "question": "How do you optimize database queries in Next.js?",
            "options": [
              "Adding indexes",
              "Using query caching",
              "Optimizing query structure",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of using a database adapter?",
            "options": [
              "Simplifies database interactions",
              "Provides type safety",
              "Offers additional features",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you handle database errors in Next.js?",
            "options": [
              "Try/catch blocks",
              "Error boundaries",
              "Custom error handling",
              "All of the above"
            ],
            "answer": "All of the above"
          }
        ]
      },
      {
        "name": "State Management",
        "data": [
          {
            "question": "What are common state management solutions in Next.js?",
            "options": [
              "React context",
              "Redux",
              "Zustand",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "When should you use external state management?",
            "options": [
              "When prop drilling becomes unwieldy",
              "When state needs to be shared across many components",
              "When state is complex",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of React context?",
            "options": [
              "Built into React",
              "Simple for moderate state needs",
              "No additional dependencies",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is server state vs client state?",
            "options": [
              "Server state comes from the backend, client state is UI state",
              "They are the same thing",
              "Server state is for APIs, client state is for components",
              "There is no difference"
            ],
            "answer": "Server state comes from the backend, client state is UI state"
          },
          {
            "question": "What is SWR used for?",
            "options": [
              "Managing server state",
              "Client-side data fetching",
              "Caching and revalidation",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of Zustand?",
            "options": [
              "Simple API",
              "No boilerplate",
              "Small bundle size",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you persist state in Next.js?",
            "options": [
              "Using localStorage",
              "Using cookies",
              "Using server-side storage",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of Redux Toolkit?",
            "options": [
              "To simplify Redux usage",
              "To reduce boilerplate",
              "To provide best practices by default",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you handle state between page navigations?",
            "options": [
              "Using _app.js to wrap pages",
              "Using a state management library",
              "Using URL params",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of Jotai?",
            "options": [
              "Atomic state management",
              "Simple API",
              "Good for derived state",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you manage form state?",
            "options": [
              "Using React Hook Form",
              "Using Formik",
              "Using controlled components",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of Recoil?",
            "options": [
              "State management with minimal boilerplate",
              "Handling async state",
              "Managing complex state relationships",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you handle global UI state?",
            "options": [
              "Using context",
              "Using a state management library",
              "Using component composition",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of using URL for state?",
            "options": [
              "Shareable links",
              "Back/forward navigation works",
              "Server-side accessible",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you optimize state management performance?",
            "options": [
              "Memoizing selectors",
              "Splitting contexts",
              "Using appropriate libraries",
              "All of the above"
            ],
            "answer": "All of the above"
          }
        ]
      },
      {
        "name": "Form Handling",
        "data": [
          {
            "question": "What are common form libraries for Next.js?",
            "options": [
              "React Hook Form",
              "Formik",
              "Both A and B",
              "Next.js has built-in forms"
            ],
            "answer": "Both A and B"
          },
          {
            "question": "What is the benefit of React Hook Form?",
            "options": [
              "Performance optimized",
              "Minimal re-renders",
              "Simple API",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you handle form validation?",
            "options": [
              "Using schema validation like Zod",
              "Built-in browser validation",
              "Custom validation functions",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is controlled vs uncontrolled components?",
            "options": [
              "Controlled: React manages state, Uncontrolled: DOM manages state",
              "They are the same",
              "Controlled is for forms, uncontrolled for other components",
              "No difference in Next.js"
            ],
            "answer": "Controlled: React manages state, Uncontrolled: DOM manages state"
          },
          {
            "question": "How do you handle form submission?",
            "options": [
              "Using onSubmit handler",
              "Using API routes",
              "Using getServerSideProps",
              "All of the above"
            ],
            "answer": "Using onSubmit handler"
          },
          {
            "question": "What is the purpose of Formik?",
            "options": [
              "To simplify form state management",
              "To handle validation",
              "To manage submission",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement multi-step forms?",
            "options": [
              "Using state to track current step",
              "Using URL parameters",
              "Using separate components for each step",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of schema validation?",
            "options": [
              "Type safety",
              "Single source of truth",
              "Reusable validation rules",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you handle file uploads?",
            "options": [
              "Using FormData",
              "Using specialized components",
              "Using API routes",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of useFormContext?",
            "options": [
              "To access form methods in nested components",
              "To create form context",
              "To handle form submission",
              "To validate fields"
            ],
            "answer": "To access form methods in nested components"
          },
          {
            "question": "How do you optimize form performance?",
            "options": [
              "Using uncontrolled components when possible",
              "Memoizing components",
              "Using performant libraries",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of debouncing form inputs?",
            "options": [
              "Reduces unnecessary renders",
              "Improves performance",
              "Prevents rapid firing of events",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement dependent fields?",
            "options": [
              "Using watch/useWatch to observe fields",
              "Using form state",
              "Using custom logic",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of Yup with Formik?",
            "options": [
              "Schema validation",
              "Form state management",
              "Handling submission",
              "Styling forms"
            ],
            "answer": "Schema validation"
          },
          {
            "question": "How do you handle form errors?",
            "options": [
              "Displaying near fields",
              "Showing summary at top",
              "Using toast notifications",
              "All of the above"
            ],
            "answer": "All of the above"
          }
        ]
      },
      {
        "name": "Testing",
        "data": [
          {
            "question": "What are common testing tools for Next.js?",
            "options": [
              "Jest",
              "React Testing Library",
              "Cypress",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you test Next.js API routes?",
            "options": [
              "Using Jest and supertest",
              "Manual testing",
              "Using Cypress",
              "API routes can't be tested"
            ],
            "answer": "Using Jest and supertest"
          },
          {
            "question": "What is the purpose of React Testing Library?",
            "options": [
              "To test components like users interact with them",
              "To test implementation details",
              "To style components",
              "To manage state"
            ],
            "answer": "To test components like users interact with them"
          },
          {
            "question": "How do you test pages using getServerSideProps?",
            "options": [
              "Mocking the function and testing rendered output",
              "Testing can't be done",
              "Only manual testing",
              "Using snapshot testing only"
            ],
            "answer": "Mocking the function and testing rendered output"
          },
          {
            "question": "What is the benefit of Cypress?",
            "options": [
              "End-to-end testing",
              "Real browser testing",
              "Time travel debugging",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you mock API calls in tests?",
            "options": [
              "Using Jest mock functions",
              "Using MSW (Mock Service Worker)",
              "Using fetch-mock",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is snapshot testing?",
            "options": [
              "Comparing rendered output to saved snapshot",
              "Taking screenshots of components",
              "Testing performance snapshots",
              "A type of unit test"
            ],
            "answer": "Comparing rendered output to saved snapshot"
          },
          {
            "question": "How do you test authentication flows?",
            "options": [
              "Using Cypress for end-to-end tests",
              "Mocking auth context in unit tests",
              "Testing auth API routes",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of Jest?",
            "options": [
              "JavaScript testing framework",
              "Test runner",
              "Assertion library",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you test dynamic routes?",
            "options": [
              "Mocking router parameters",
              "Testing with different route params",
              "Using Cypress to navigate",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is integration testing?",
            "options": [
              "Testing how units work together",
              "A type of unit test",
              "Same as end-to-end testing",
              "Testing CSS styles"
            ],
            "answer": "Testing how units work together"
          },
          {
            "question": "How do you test error boundaries?",
            "options": [
              "Forcing errors in components",
              "Mocking error states",
              "Testing error UI",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of MSW?",
            "options": [
              "API mocking at network level",
              "Works across testing tools",
              "Realistic mocking",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you test responsive designs?",
            "options": [
              "Using Cypress viewport commands",
              "Jest snapshot at different sizes",
              "Manual testing",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of code coverage?",
            "options": [
              "To identify untested code",
              "To ensure test quality",
              "To meet requirements",
              "All of the above"
            ],
            "answer": "All of the above"
          }
        ]
      },
      {
        "name": "Deployment",
        "data": [
          {
            "question": "What are common hosting platforms for Next.js?",
            "options": [
              "Vercel",
              "Netlify",
              "AWS",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of deploying to Vercel?",
            "options": [
              "Built by Next.js creators",
              "Optimized for Next.js",
              "Simple deployment process",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you deploy a Next.js app manually?",
            "options": [
              "npm run build then npm run start",
              "Using Docker",
              "Configuring a Node server",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of next start?",
            "options": [
              "To start production server",
              "To start development server",
              "To build the application",
              "To run tests"
            ],
            "answer": "To start production server"
          },
          {
            "question": "How do you configure environment variables for production?",
            "options": [
              "In hosting provider settings",
              "In .env.production file",
              "In next.config.js",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of standalone output mode?",
            "options": [
              "To create self-contained deployment",
              "To optimize performance",
              "To reduce dependencies",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement CI/CD for Next.js?",
            "options": [
              "Using GitHub Actions",
              "Using Vercel's built-in CI",
              "Using other CI providers",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of ISR for deployment?",
            "options": [
              "Faster builds",
              "Dynamic content with static benefits",
              "Better scalability",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you deploy to a subpath?",
            "options": [
              "Using basePath in next.config.js",
              "Using assetPrefix",
              "Configuring hosting provider",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of next export?",
            "options": [
              "To create fully static HTML export",
              "To optimize images",
              "To bundle dependencies",
              "To run tests"
            ],
            "answer": "To create fully static HTML export"
          },
          {
            "question": "How do you monitor production deployments?",
            "options": [
              "Using logging services",
              "Using APM tools",
              "Using health checks",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of edge deployments?",
            "options": [
              "Lower latency",
              "Global distribution",
              "Better performance",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you rollback a bad deployment?",
            "options": [
              "Redeploy previous version",
              "Use hosting provider rollback",
              "Use CI/CD pipeline features",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of runtime configuration?",
            "options": [
              "To configure app after build",
              "To handle environment variables",
              "To manage feature flags",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you optimize deployment speed?",
            "options": [
              "Using incremental builds",
              "Caching dependencies",
              "Parallelizing tasks",
              "All of the above"
            ],
            "answer": "All of the above"
          }
        ]
      },
      {
        "name": "SEO and Meta Tags",
        "data": [
          {
            "question": "What is the purpose of next/head?",
            "options": [
              "To modify document head",
              "To handle routing",
              "To manage state",
              "To style components"
            ],
            "answer": "To modify document head"
          },
          {
            "question": "How do you implement dynamic meta tags?",
            "options": [
              "Using next/head with props",
              "Using getServerSideProps",
              "Using API routes",
              "All of the above"
            ],
            "answer": "Using next/head with props"
          },
          {
            "question": "What are important meta tags for SEO?",
            "options": [
              "title",
              "description",
              "og: tags",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How does Next.js help with SEO?",
            "options": [
              "Server-side rendering",
              "Static generation",
              "Built-in optimizations",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of semantic HTML?",
            "options": [
              "Better accessibility",
              "Improved SEO",
              "Easier to maintain",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement JSON-LD structured data?",
            "options": [
              "Using next/script",
              "Adding to next/head",
              "Using a component",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of canonical URLs?",
            "options": [
              "To prevent duplicate content issues",
              "To improve performance",
              "To handle routing",
              "To manage state"
            ],
            "answer": "To prevent duplicate content issues"
          },
          {
            "question": "How do you implement sitemaps in Next.js?",
            "options": [
              "Using next-sitemap plugin",
              "Creating an API route",
              "Manual XML file",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of static generation for SEO?",
            "options": [
              "Faster page loads",
              "Easier for crawlers to index",
              "More reliable content",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement robots.txt?",
            "options": [
              "In public folder",
              "Using an API route",
              "Using next.config.js",
              "All of the above"
            ],
            "answer": "In public folder"
          },
          {
            "question": "What is the purpose of Open Graph tags?",
            "options": [
              "To control how content appears when shared",
              "To improve performance",
              "To handle routing",
              "To manage state"
            ],
            "answer": "To control how content appears when shared"
          },
          {
            "question": "How do you implement dynamic titles?",
            "options": [
              "Using next/head with page props",
              "Using getServerSideProps",
              "Using context",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of next-seo?",
            "options": [
              "Simplifies SEO implementation",
              "Provides defaults",
              "Handles common patterns",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you measure SEO performance?",
            "options": [
              "Google Search Console",
              "Analytics tools",
              "SEO auditing tools",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of alt text on images?",
            "options": [
              "Accessibility",
              "SEO benefits",
              "Display when images don't load",
              "All of the above"
            ],
            "answer": "All of the above"
          }
        ]
      },
      {
        "name": "Advanced Features",
        "data": [
          {
            "question": "What are Next.js middleware functions?",
            "options": [
              "Code that runs before a request is completed",
              "A way to style components",
              "A state management solution",
              "A database integration"
            ],
            "answer": "Code that runs before a request is completed"
          },
          {
            "question": "What is the Edge Runtime in Next.js?",
            "options": [
              "A lightweight runtime for edge functions",
              "A performance optimization tool",
              "A styling solution",
              "A database adapter"
            ],
            "answer": "A lightweight runtime for edge functions"
          },
          {
            "question": "How do you implement A/B testing in Next.js?",
            "options": [
              "Using middleware to route users",
              "Using feature flags",
              "Using different page versions",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of next/script?",
            "options": [
              "To optimize third-party script loading",
              "To write server scripts",
              "To handle routing",
              "To manage state"
            ],
            "answer": "To optimize third-party script loading"
          },
          {
            "question": "How do you implement WebSockets in Next.js?",
            "options": [
              "Using API routes as entry points",
              "Using a separate WebSocket server",
              "Using edge functions",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of React Server Components?",
            "options": [
              "Reduced bundle size",
              "Faster page loads",
              "Direct database access from components",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement real-time features?",
            "options": [
              "Using WebSockets",
              "Using Server-Sent Events",
              "Using polling",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of next/amp?",
            "options": [
              "To create AMP pages",
              "To optimize performance",
              "To handle analytics",
              "To manage state"
            ],
            "answer": "To create AMP pages"
          },
          {
            "question": "How do you implement i18n routing?",
            "options": [
              "Using Next.js built-in i18n",
              "Using next-i18next",
              "Using custom routing",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of edge functions?",
            "options": [
              "Lower latency",
              "Global distribution",
              "Lightweight runtime",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement feature flags?",
            "options": [
              "Using environment variables",
              "Using a feature flag service",
              "Using runtime configuration",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the purpose of next/legacy/image?",
            "options": [
              "Backwards compatibility for old Image component",
              "To handle legacy images",
              "To optimize old browsers",
              "To manage state"
            ],
            "answer": "Backwards compatibility for old Image component"
          },
          {
            "question": "How do you implement analytics in Next.js?",
            "options": [
              "Using next/script for third-party scripts",
              "Using API routes to collect data",
              "Using middleware for tracking",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "What is the benefit of incremental static regeneration?",
            "options": [
              "Fresh content without full rebuild",
              "Better performance than SSR",
              "Simpler scaling than SSR",
              "All of the above"
            ],
            "answer": "All of the above"
          },
          {
            "question": "How do you implement a custom server with Next.js?",
            "options": [
              "Using server.js file",
              "Extending the built-in server",
              "Using a separate Node server",
              "All of the above"
            ],
            "answer": "All of the above"
          }
        ]
      }

  ];

  static List<String> getTopicNames() {
    return quizTopics.map((topic) => topic['name'] as String).toList();
  }

  static Map<String, dynamic>? getTopicData(String topicName) {
    try {
      return quizTopics.firstWhere((topic) => topic['name'] == topicName);
    } catch (e) {
      return null;
    }
  }

  static List<Map<String, dynamic>> getQuestionsForTopic(String topicName) {
    final topicData = getTopicData(topicName);
    if (topicData != null && topicData['data'] != null) {
      return List<Map<String, dynamic>>.from(topicData['data']);
    }
    return [];
  }

  // Helper method to find a topic by category name (case-insensitive matching)
  static String? findMatchingTopicName(String categoryName) {
    final lowerCategoryName = categoryName.toLowerCase();

    // Direct name matching
    for (final topic in quizTopics) {
      final topicName = topic['name'] as String;
      if (topicName.toLowerCase() == lowerCategoryName) {
        return topicName;
      }
    }

    // Partial matching for common variations
    final partialMatches = {
      'react': 'React Fundamentals',
      'next': 'Next.js Basics',
      'nextjs': 'Next.js Basics',
      'routing': 'Routing System',
      'flutter': 'Flutter Basics',
      'mobile': 'Flutter Basics',
      'dart': 'Flutter Basics',
      'javascript': 'JavaScript Essentials',
      'js': 'JavaScript Essentials',
      'web': 'React Fundamentals',
      'frontend': 'React Fundamentals',
      'ui': 'React Fundamentals',
      'component': 'React Fundamentals',
      'development': 'Flutter Basics',
      'programming': 'Python Programming',
      'framework': 'React Fundamentals',
      'api': 'Next.js Basics',
      'data': 'Database Fundamentals',
      'server': 'Node.js Development',
      'python': 'Python Programming',
      'css': 'CSS Fundamentals',
      'style': 'CSS Fundamentals',
      'styling': 'CSS Fundamentals',
      'html': 'HTML Basics',
      'markup': 'HTML Basics',
      'node': 'Node.js Development',
      'nodejs': 'Node.js Development',
      'database': 'Database Fundamentals',
      'sql': 'Database Fundamentals',
      'git': 'Git & Version Control',
      'version': 'Git & Version Control',
      'real': 'Real-time Features',
      'realtime': 'Real-time Features',
      'real-time': 'Real-time Features',
      'websocket': 'Real-time Features',
      'socket': 'Real-time Features',
      'api': 'API Development',
      'rest': 'API Development',
      'graphql': 'API Development',
      'endpoint': 'API Development',
      'mobile': 'Mobile Development',
      'ios': 'Mobile Development',
      'android': 'Mobile Development',
      'react-native': 'Mobile Development',
      'xamarin': 'Mobile Development',
      'security': 'Web Security',
      'https': 'Web Security',
      'cors': 'Web Security',
      'jwt': 'Web Security',
      'authentication': 'Web Security',
      'cloud': 'Cloud Computing',
      'aws': 'Cloud Computing',
      'azure': 'Cloud Computing',
      'docker': 'Cloud Computing',
      'kubernetes': 'Cloud Computing',
      'serverless': 'Cloud Computing',
    };

    for (final entry in partialMatches.entries) {
      if (lowerCategoryName.contains(entry.key)) {
        return entry.value;
      }
    }

    // Default fallback to first topic if no match found
    return quizTopics.isNotEmpty ? quizTopics.first['name'] as String : null;
  }
}
