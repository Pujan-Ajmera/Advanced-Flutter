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
      'javascript': 'React Fundamentals',
      'js': 'React Fundamentals',
      'web': 'React Fundamentals',
      'frontend': 'React Fundamentals',
      'ui': 'React Fundamentals',
      'component': 'React Fundamentals',
      'development': 'Flutter Basics',
      'programming': 'Flutter Basics',
      'framework': 'React Fundamentals',
      'api': 'Next.js Basics',
      'data': 'Next.js Basics',
      'server': 'Next.js Basics',
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
