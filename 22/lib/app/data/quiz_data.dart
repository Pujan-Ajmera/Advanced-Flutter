class QuizData {
  // Your JSON data converted to Dart
  static const List<Map<String, dynamic>> quizTopics = [
    {
      "name": "React Fundamentals",
      "data": [
        {
          "question": "What is the correct way to create a React component?",
          "options": [
            "function MyComponent() { return <div>Hello</div>; }",
            "class MyComponent extends React.Component { render() { return <div>Hello</div>; } }",
            "const MyComponent = () => <div>Hello</div>;",
            "All of the above",
          ],
          "answer": "All of the above",
        },
        {
          "question": "What is JSX?",
          "options": [
            "A JavaScript extension that allows HTML-like syntax",
            "A templating language separate from JavaScript",
            "A CSS preprocessor",
            "A state management library",
          ],
          "answer": "A JavaScript extension that allows HTML-like syntax",
        },
        {
          "question": "What is the purpose of React hooks?",
          "options": [
            "To handle CSS styling in components",
            "To add state and lifecycle features to functional components",
            "To create custom HTML elements",
            "To manage routing in React applications",
          ],
          "answer":
              "To add state and lifecycle features to functional components",
        },
        {
          "question":
              "Which hook is used for side effects in functional components?",
          "options": ["useState", "useEffect", "useContext", "useReducer"],
          "answer": "useEffect",
        },
        {
          "question": "What is the virtual DOM in React?",
          "options": [
            "A lightweight copy of the actual DOM",
            "A 3D rendering engine",
            "A database for storing component state",
            "A browser extension for debugging",
          ],
          "answer": "A lightweight copy of the actual DOM",
        },
      ],
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
            "Writing backend services in Python",
          ],
          "answer": "Building static and server-rendered React applications",
        },
        {
          "question":
              "Which file is used as the main entry point in a Next.js application?",
          "options": [
            "pages/_app.js",
            "pages/index.js",
            "pages/main.js",
            "pages/app.js",
          ],
          "answer": "pages/_app.js",
        },
        {
          "question": "What is the purpose of the pages directory in Next.js?",
          "options": [
            "To store CSS files",
            "To store API routes",
            "To automatically create routes based on file structure",
            "To store test files",
          ],
          "answer": "To automatically create routes based on file structure",
        },
        {
          "question": "How does Next.js handle images by default?",
          "options": [
            "Using the standard HTML img tag",
            "Using a custom Image component that optimizes loading",
            "It doesn't support images",
            "Only through external CDNs",
          ],
          "answer": "Using a custom Image component that optimizes loading",
        },
        {
          "question": "What is Static Generation in Next.js?",
          "options": [
            "Generating HTML at build time",
            "Generating HTML on each request",
            "A CSS preprocessor",
            "A state management solution",
          ],
          "answer": "Generating HTML at build time",
        },
      ],
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
            "Next.js doesn't support routing",
          ],
          "answer":
              "Automatically based on the filesystem in the pages directory",
        },
        {
          "question":
              "What is the correct way to create a nested route in Next.js?",
          "options": [
            "By creating nested folders in the pages directory",
            "By using special route configuration",
            "By adding prefixes to filenames",
            "Nested routes aren't possible",
          ],
          "answer": "By creating nested folders in the pages directory",
        },
        {
          "question": "How do you create a dynamic route in Next.js?",
          "options": [
            "By adding brackets to a page filename, like [id].js",
            "By using a special dynamic keyword",
            "By configuring next.config.js",
            "Dynamic routes aren't possible in Next.js",
          ],
          "answer": "By adding brackets to a page filename, like [id].js",
        },
        {
          "question": "What is the purpose of the useRouter hook?",
          "options": [
            "To access the router object in client-side components",
            "To configure server-side routing",
            "To style navigation elements",
            "To create API routes",
          ],
          "answer": "To access the router object in client-side components",
        },
        {
          "question":
              "How do you programmatically navigate between pages in Next.js?",
          "options": [
            "Using window.location",
            "Using the push method from the router object",
            "Using the navigate component",
            "Using the redirect function",
          ],
          "answer": "Using the push method from the router object",
        },
      ],
    },
    {
      "name": "Flutter Basics",
      "data": [
        {
          "question": "What is Flutter?",
          "options": [
            "A mobile operating system",
            "A cross-platform app development framework",
            "A programming language",
            "A database management system",
          ],
          "answer": "A cross-platform app development framework",
        },
        {
          "question":
              "Which programming language is primarily used in Flutter?",
          "options": ["Java", "Kotlin", "Dart", "Swift"],
          "answer": "Dart",
        },
        {
          "question": "What is a Widget in Flutter?",
          "options": [
            "A small application",
            "Everything in Flutter UI is a widget",
            "A type of database",
            "A debugging tool",
          ],
          "answer": "Everything in Flutter UI is a widget",
        },
        {
          "question": "Which company developed Flutter?",
          "options": ["Microsoft", "Apple", "Google", "Facebook"],
          "answer": "Google",
        },
        {
          "question": "What does 'Hot Reload' do in Flutter?",
          "options": [
            "Restarts the entire application",
            "Quickly updates the UI without losing app state",
            "Compiles the code to native",
            "Clears the cache",
          ],
          "answer": "Quickly updates the UI without losing app state",
        },
      ],
    },
    {
      "name": "JavaScript Essentials",
      "data": [
        {
          "question":
              "What is the difference between let and var in JavaScript?",
          "options": [
            "let has block scope, var has function scope",
            "let has function scope, var has block scope",
            "There is no difference",
            "let is used for constants, var for variables",
          ],
          "answer": "let has block scope, var has function scope",
        },
        {
          "question": "What is a closure in JavaScript?",
          "options": [
            "A way to close the browser",
            "A function that has access to variables in its outer scope",
            "A type of loop",
            "A method to delete variables",
          ],
          "answer":
              "A function that has access to variables in its outer scope",
        },
        {
          "question":
              "Which method is used to add an element to the end of an array?",
          "options": ["push()", "pop()", "shift()", "unshift()"],
          "answer": "push()",
        },
        {
          "question": "What does the '===' operator do in JavaScript?",
          "options": [
            "Checks for equality without type coercion",
            "Checks for equality with type coercion",
            "Assigns a value",
            "Checks if greater than or equal",
          ],
          "answer": "Checks for equality without type coercion",
        },
        {
          "question": "What is the purpose of async/await in JavaScript?",
          "options": [
            "To handle asynchronous operations more readable way",
            "To create loops",
            "To define classes",
            "To handle errors",
          ],
          "answer": "To handle asynchronous operations more readable way",
        },
      ],
    },
    {
      "name": "Python Programming",
      "data": [
        {
          "question": "What is Python?",
          "options": [
            "A snake species",
            "A high-level programming language",
            "A web browser",
            "A database system",
          ],
          "answer": "A high-level programming language",
        },
        {
          "question":
              "Which of the following is a mutable data type in Python?",
          "options": ["tuple", "string", "list", "integer"],
          "answer": "list",
        },
        {
          "question": "What does PEP 8 refer to?",
          "options": [
            "Python's style guide",
            "Python's version number",
            "A Python library",
            "Python's error handling",
          ],
          "answer": "Python's style guide",
        },
        {
          "question": "What is the output of print(type([]))?",
          "options": [
            "<class 'list'>",
            "<class 'array'>",
            "<class 'tuple'>",
            "<class 'dict'>",
          ],
          "answer": "<class 'list'>",
        },
        {
          "question": "Which keyword is used to define a function in Python?",
          "options": ["function", "def", "define", "func"],
          "answer": "def",
        },
      ],
    },
    {
      "name": "CSS Fundamentals",
      "data": [
        {
          "question": "What does CSS stand for?",
          "options": [
            "Cascading Style Sheets",
            "Creative Style Sheets",
            "Computer Style Sheets",
            "Colorful Style Sheets",
          ],
          "answer": "Cascading Style Sheets",
        },
        {
          "question": "Which property is used to change the background color?",
          "options": [
            "background-color",
            "bg-color",
            "color-background",
            "background",
          ],
          "answer": "background-color",
        },
        {
          "question": "What is the correct CSS syntax for flexbox?",
          "options": [
            "display: flex",
            "display: flexbox",
            "flex: display",
            "flexbox: true",
          ],
          "answer": "display: flex",
        },
        {
          "question":
              "Which CSS property controls the spacing between elements?",
          "options": ["margin", "padding", "spacing", "gap"],
          "answer": "margin",
        },
        {
          "question": "What is the CSS box model?",
          "options": [
            "A way to define content, padding, border, and margin",
            "A method to create animations",
            "A tool for responsive design",
            "A CSS framework",
          ],
          "answer": "A way to define content, padding, border, and margin",
        },
      ],
    },
    {
      "name": "HTML Basics",
      "data": [
        {
          "question": "What does HTML stand for?",
          "options": [
            "HyperText Markup Language",
            "High Tech Modern Language",
            "Home Tool Markup Language",
            "Hyperlink and Text Markup Language",
          ],
          "answer": "HyperText Markup Language",
        },
        {
          "question": "Which HTML element is used for the largest heading?",
          "options": ["<h1>", "<h6>", "<heading>", "<header>"],
          "answer": "<h1>",
        },
        {
          "question":
              "What is the correct HTML element for inserting a line break?",
          "options": ["<br>", "<lb>", "<break>", "<newline>"],
          "answer": "<br>",
        },
        {
          "question":
              "Which attribute specifies the URL of the page the link goes to?",
          "options": ["href", "src", "link", "url"],
          "answer": "href",
        },
        {
          "question": "What is the purpose of the <meta> tag?",
          "options": [
            "To provide metadata about the HTML document",
            "To create navigation menus",
            "To display images",
            "To add JavaScript code",
          ],
          "answer": "To provide metadata about the HTML document",
        },
      ],
    },
    {
      "name": "Node.js Development",
      "data": [
        {
          "question": "What is Node.js?",
          "options": [
            "A JavaScript runtime built on Chrome's V8 engine",
            "A web framework",
            "A database system",
            "A CSS preprocessor",
          ],
          "answer": "A JavaScript runtime built on Chrome's V8 engine",
        },
        {
          "question": "Which command is used to install packages in Node.js?",
          "options": [
            "npm install",
            "node install",
            "package install",
            "install npm",
          ],
          "answer": "npm install",
        },
        {
          "question": "What is Express.js?",
          "options": [
            "A web application framework for Node.js",
            "A database ORM",
            "A testing framework",
            "A CSS framework",
          ],
          "answer": "A web application framework for Node.js",
        },
        {
          "question": "Which file contains project dependencies in Node.js?",
          "options": [
            "package.json",
            "node.json",
            "dependencies.json",
            "config.json",
          ],
          "answer": "package.json",
        },
        {
          "question": "What is middleware in Express.js?",
          "options": [
            "Functions that execute during the request-response cycle",
            "Database connection tools",
            "Frontend components",
            "Error handling methods",
          ],
          "answer": "Functions that execute during the request-response cycle",
        },
      ],
    },
    {
      "name": "Database Fundamentals",
      "data": [
        {
          "question": "What does SQL stand for?",
          "options": [
            "Structured Query Language",
            "Simple Query Language",
            "Standard Query Language",
            "Sequential Query Language",
          ],
          "answer": "Structured Query Language",
        },
        {
          "question":
              "Which SQL command is used to retrieve data from a database?",
          "options": ["SELECT", "GET", "RETRIEVE", "FETCH"],
          "answer": "SELECT",
        },
        {
          "question": "What is a primary key in a database?",
          "options": [
            "A unique identifier for each record in a table",
            "The first column in a table",
            "A password for database access",
            "The most important data in a table",
          ],
          "answer": "A unique identifier for each record in a table",
        },
        {
          "question": "What is the difference between SQL and NoSQL databases?",
          "options": [
            "SQL uses structured data, NoSQL uses unstructured data",
            "SQL is faster than NoSQL",
            "NoSQL is older than SQL",
            "There is no difference",
          ],
          "answer": "SQL uses structured data, NoSQL uses unstructured data",
        },
        {
          "question": "What is normalization in databases?",
          "options": [
            "Organizing data to reduce redundancy",
            "Adding more data to tables",
            "Creating backup copies",
            "Encrypting sensitive data",
          ],
          "answer": "Organizing data to reduce redundancy",
        },
      ],
    },
    {
      "name": "Git & Version Control",
      "data": [
        {
          "question": "What is Git?",
          "options": [
            "A distributed version control system",
            "A programming language",
            "A web browser",
            "A database system",
          ],
          "answer": "A distributed version control system",
        },
        {
          "question": "Which command is used to clone a repository?",
          "options": ["git clone", "git copy", "git download", "git get"],
          "answer": "git clone",
        },
        {
          "question": "What does 'git commit' do?",
          "options": [
            "Saves changes to the local repository",
            "Uploads changes to remote repository",
            "Downloads latest changes",
            "Deletes the repository",
          ],
          "answer": "Saves changes to the local repository",
        },
        {
          "question": "What is a branch in Git?",
          "options": [
            "A parallel version of the repository",
            "A type of commit message",
            "A remote repository",
            "A merge conflict",
          ],
          "answer": "A parallel version of the repository",
        },
        {
          "question": "Which command shows the status of working directory?",
          "options": ["git status", "git info", "git check", "git state"],
          "answer": "git status",
        },
      ],
    },
    {
      "name": "Real-time Features",
      "data": [
        {
          "question": "What is WebSocket used for in real-time applications?",
          "options": [
            "Full-duplex communication over a single TCP connection",
            "Only for file downloads",
            "Database transactions",
            "Static content serving",
          ],
          "answer": "Full-duplex communication over a single TCP connection",
        },
        {
          "question":
              "Which protocol is commonly used for real-time messaging?",
          "options": ["WebRTC", "HTTP/2", "WebSocket", "All of the above"],
          "answer": "All of the above",
        },
        {
          "question": "What is Socket.io primarily used for?",
          "options": [
            "Real-time bidirectional event-based communication",
            "File compression",
            "Image processing",
            "Database management",
          ],
          "answer": "Real-time bidirectional event-based communication",
        },
        {
          "question":
              "What is the purpose of polling in real-time applications?",
          "options": [
            "To periodically check for updates from the server",
            "To reduce server load",
            "To encrypt data",
            "To compress files",
          ],
          "answer": "To periodically check for updates from the server",
        },
        {
          "question":
              "Which is more efficient for real-time updates: long polling or WebSockets?",
          "options": [
            "WebSockets for continuous communication",
            "Long polling is always better",
            "They are equally efficient",
            "Neither is suitable for real-time",
          ],
          "answer": "WebSockets for continuous communication",
        },
      ],
    },
    {
      "name": "API Development",
      "data": [
        {
          "question": "What does REST stand for?",
          "options": [
            "Representational State Transfer",
            "Remote Execution Service Transfer",
            "Rapid Event Service Transfer",
            "Resource State Transaction",
          ],
          "answer": "Representational State Transfer",
        },
        {
          "question": "Which HTTP method is used to create a new resource?",
          "options": ["POST", "GET", "PUT", "DELETE"],
          "answer": "POST",
        },
        {
          "question": "What is the purpose of HTTP status code 404?",
          "options": [
            "Resource not found",
            "Server error",
            "Successful request",
            "Unauthorized access",
          ],
          "answer": "Resource not found",
        },
        {
          "question": "What is GraphQL?",
          "options": [
            "A query language for APIs",
            "A database system",
            "A programming language",
            "A web framework",
          ],
          "answer": "A query language for APIs",
        },
        {
          "question": "Which header is used for API authentication?",
          "options": ["Authorization", "Content-Type", "Accept", "User-Agent"],
          "answer": "Authorization",
        },
      ],
    },
    {
      "name": "Mobile Development",
      "data": [
        {
          "question": "What is React Native?",
          "options": [
            "A framework for building mobile apps using React",
            "A database for mobile apps",
            "A testing framework",
            "A deployment tool",
          ],
          "answer": "A framework for building mobile apps using React",
        },
        {
          "question": "Which language is used for iOS native development?",
          "options": ["Swift", "Java", "Python", "JavaScript"],
          "answer": "Swift",
        },
        {
          "question": "What is Xamarin?",
          "options": [
            "A cross-platform mobile development framework",
            "A mobile testing tool",
            "A mobile analytics platform",
            "A mobile payment system",
          ],
          "answer": "A cross-platform mobile development framework",
        },
        {
          "question": "Which file format is used for Android app packages?",
          "options": [".apk", ".ipa", ".exe", ".dmg"],
          "answer": ".apk",
        },
        {
          "question":
              "What is the difference between hot reload and hot restart in Flutter?",
          "options": [
            "Hot reload preserves state, hot restart resets the app",
            "They are the same thing",
            "Hot restart is faster",
            "Hot reload only works in debug mode",
          ],
          "answer": "Hot reload preserves state, hot restart resets the app",
        },
      ],
    },
    {
      "name": "Web Security",
      "data": [
        {
          "question": "What does HTTPS provide?",
          "options": [
            "Encryption and authentication",
            "Faster loading times",
            "Better SEO ranking",
            "Automatic caching",
          ],
          "answer": "Encryption and authentication",
        },
        {
          "question": "What is Cross-Site Scripting (XSS)?",
          "options": [
            "Injecting malicious scripts into web pages",
            "A legitimate web development technique",
            "A type of CSS styling",
            "A JavaScript framework",
          ],
          "answer": "Injecting malicious scripts into web pages",
        },
        {
          "question": "What is CORS?",
          "options": [
            "Cross-Origin Resource Sharing",
            "Content Organization and Resource System",
            "Cascading Object Resource Sharing",
            "Cross-Origin Request Security",
          ],
          "answer": "Cross-Origin Resource Sharing",
        },
        {
          "question": "What is JWT used for?",
          "options": [
            "Authentication and information exchange",
            "Database management",
            "File compression",
            "Image processing",
          ],
          "answer": "Authentication and information exchange",
        },
        {
          "question": "What does SQL injection exploit?",
          "options": [
            "Unsanitized database queries",
            "Network protocols",
            "File systems",
            "Memory management",
          ],
          "answer": "Unsanitized database queries",
        },
      ],
    },
    {
      "name": "Cloud Computing",
      "data": [
        {
          "question": "What is AWS?",
          "options": [
            "Amazon Web Services",
            "Advanced Web Security",
            "Automated Website System",
            "Application Web Server",
          ],
          "answer": "Amazon Web Services",
        },
        {
          "question": "What is serverless computing?",
          "options": [
            "Running code without managing servers",
            "Computing without internet",
            "Using only local servers",
            "Computing without electricity",
          ],
          "answer": "Running code without managing servers",
        },
        {
          "question": "What is Docker?",
          "options": [
            "A containerization platform",
            "A database system",
            "A programming language",
            "A web browser",
          ],
          "answer": "A containerization platform",
        },
        {
          "question": "What is Kubernetes?",
          "options": [
            "Container orchestration platform",
            "Database management system",
            "Programming language",
            "Text editor",
          ],
          "answer": "Container orchestration platform",
        },
        {
          "question": "What is Infrastructure as Code (IaC)?",
          "options": [
            "Managing infrastructure through code",
            "Writing code for applications",
            "Building physical servers",
            "Creating user interfaces",
          ],
          "answer": "Managing infrastructure through code",
        },
      ],
    },
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
