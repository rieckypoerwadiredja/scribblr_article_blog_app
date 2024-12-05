class ArticelModel {
  String title;
  String author;
  String authorImage;
  String publishDate;
  String publishTime;
  String articleImage;
  List<Map<String, dynamic>>
      content; // Menggunakan Map untuk tipe konten yang fleksibel
  int likes;
  int comments;

  ArticelModel({
    required this.title,
    required this.author,
    required this.authorImage,
    required this.publishDate,
    required this.publishTime,
    required this.articleImage,
    required this.content,
    required this.likes,
    required this.comments,
  });
}

var articleList = [
  ArticelModel(
    title: 'The Wonders of Flutter Development',
    author: 'John Doe',
    authorImage:
        'https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-21',
    publishTime: '10:30 AM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661378470712-98550fb28d15?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    likes: 125,
    comments: 23,
    content: [
      {
        'type': 'text',
        'value':
            'Flutter is an open-source UI software development toolkit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
      },
      {
        'type': 'image',
        'value': 'https://flutter.dev/assets/images/docs/architecture.png',
      },
      {
        'type': 'text',
        'value':
            'With Flutter, developers can build natively compiled applications for mobile, web, and desktop from a single codebase, making it a very efficient toolkit.',
      },
    ],
  ),
  ArticelModel(
    title: 'Exploring the Benefits of AI in Business',
    author: 'Jane Smith',
    authorImage:
        'https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-20',
    publishTime: '9:00 AM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661378470712-98550fb28d15?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    likes: 300,
    comments: 45,
    content: [
      {
        'type': 'text',
        'value':
            'Artificial Intelligence (AI) has revolutionized many industries by enabling automation and insights at an unprecedented scale.',
      },
      {
        'type': 'text',
        'value':
            'For instance, in e-commerce, AI helps in personalizing product recommendations, forecasting demand, and optimizing supply chains, which enhances both efficiency and customer satisfaction.',
      },
      {
        'type': 'image',
        'value': 'https://ai-revolution.com/ai-benefits.jpg',
      },
      {
        'type': 'text',
        'value':
            'Businesses that embrace AI-driven solutions are likely to have a competitive edge, as they can make better decisions faster with the help of data-driven insights.',
      },
    ],
  ),
  ArticelModel(
    title: 'Understanding Dart: The Language Behind Flutter',
    author: 'Alice Brown',
    authorImage:
        'https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-19',
    publishTime: '11:15 AM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661378470712-98550fb28d15?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    likes: 210,
    comments: 30,
    content: [
      {
        'type': 'text',
        'value':
            'Dart is a client-optimized language for fast apps on any platform. It is designed for development, providing a strong foundation for Flutter.',
      },
      {
        'type': 'text',
        'value':
            'With its rich set of features like sound null safety, asynchronous programming, and a simple syntax, Dart is an excellent choice for both new and experienced developers.',
      },
      {
        'type': 'image',
        'value': 'https://dart.dev/assets/images/shared/dart-logo.svg',
      },
    ],
  ),
  ArticelModel(
    title: 'The Future of Web Development with JavaScript',
    author: 'Tom Green',
    authorImage:
        'https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-18',
    publishTime: '2:00 PM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661378470712-98550fb28d15?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    likes: 400,
    comments: 50,
    content: [
      {
        'type': 'text',
        'value':
            'JavaScript has become an essential part of web development. With frameworks like React, Angular, and Vue, it powers the modern web experience.',
      },
      {
        'type': 'image',
        'value': 'https://www.javascript.com/images/learn-js.jpg',
      },
      {
        'type': 'text',
        'value':
            'As web applications grow more complex, JavaScript continues to evolve, offering new features that enhance developer productivity and user experience.',
      },
    ],
  ),
  ArticelModel(
    title: 'Building Scalable Applications with Node.js',
    author: 'Sara White',
    authorImage:
        'https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-17',
    publishTime: '1:00 PM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661378470712-98550fb28d15?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    likes: 150,
    comments: 20,
    content: [
      {
        'type': 'text',
        'value':
            'Node.js is a JavaScript runtime built on Chrome’s V8 JavaScript engine. It is designed to build scalable network applications.',
      },
      {
        'type': 'image',
        'value': 'https://nodejs.org/static/images/logo.svg',
      },
      {
        'type': 'text',
        'value':
            'Its non-blocking I/O model makes it efficient and suitable for data-intensive real-time applications that run across distributed devices.',
      },
    ],
  ),
  ArticelModel(
    title: 'Introduction to Cloud Computing',
    author: 'Michael Black',
    authorImage:
        'https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-16',
    publishTime: '3:00 PM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661378470712-98550fb28d15?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    likes: 180,
    comments: 40,
    content: [
      {
        'type': 'text',
        'value':
            'Cloud computing has changed the way businesses operate. It provides on-demand availability of computer resources and storage.',
      },
      {
        'type': 'text',
        'value':
            'Companies can now access computing power, storage, and databases over the internet, allowing them to scale efficiently and save costs.',
      },
      {
        'type': 'image',
        'value': 'https://cloud.com/images/cloud.jpg',
      },
    ],
  ),
  ArticelModel(
    title: 'The Importance of Cybersecurity in the Digital Age',
    author: 'Emily Wilson',
    authorImage:
        'https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-15',
    publishTime: '4:30 PM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661378470712-98550fb28d15?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    likes: 230,
    comments: 35,
    content: [
      {
        'type': 'text',
        'value':
            'As more businesses move online, cybersecurity has become a critical concern. Protecting sensitive data from breaches is essential.',
      },
      {
        'type': 'image',
        'value': 'https://cybersecurity.com/images/security.jpg',
      },
      {
        'type': 'text',
        'value':
            'Investing in cybersecurity measures not only protects data but also builds trust with customers and stakeholders.',
      },
    ],
  ),
  ArticelModel(
    title: 'How Machine Learning is Transforming Industries',
    author: 'David Gray',
    authorImage:
        'https://images.unsplash.com/photo-1664575600850-c4b712e6e2bf?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-14',
    publishTime: '5:00 PM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661378470712-98550fb28d15?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    likes: 320,
    comments: 60,
    content: [
      {
        'type': 'text',
        'value':
            'Machine learning is a subset of AI that allows systems to learn and improve from experience without being explicitly programmed.',
      },
      {
        'type': 'text',
        'value':
            'Industries such as finance, healthcare, and retail are leveraging machine learning to analyze data, predict trends, and enhance decision-making processes.',
      },
      {
        'type': 'image',
        'value': 'https://machinelearning.com/images/ml.jpg',
      },
    ],
  ),
];
