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
        'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-21',
    publishTime: '10:30 AM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661877737564-3dfd7282efcb?q=80&w=1800&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
        'value':
            'https://plus.unsplash.com/premium_photo-1664297847109-a01715c2dc8e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
        'https://images.unsplash.com/photo-1622861431942-b45f2b5b6564?q=80&w=1886&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-20',
    publishTime: '9:00 AM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1661772661721-b16346fe5b0f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
        'value':
            'https://plus.unsplash.com/premium_photo-1683121710572-7723bd2e235d?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
        'https://plus.unsplash.com/premium_photo-1694557636097-5969bae91ba8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-19',
    publishTime: '11:15 AM',
    articleImage:
        'https://plus.unsplash.com/premium_photo-1683140655656-20448abc55da?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
        'value':
            'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      },
    ],
  ),
  ArticelModel(
    title: 'The Future of Web Development with JavaScript',
    author: 'Tom Green',
    authorImage:
        'https://plus.unsplash.com/premium_photo-1664533227571-cb18551cac82?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-18',
    publishTime: '2:00 PM',
    articleImage:
        'https://images.unsplash.com/photo-1598316560453-0246d4611979?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
        'value':
            'https://plus.unsplash.com/premium_photo-1685086785077-ff65bf749544?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
        'https://images.unsplash.com/photo-1562038969-e85c13ecb2ac?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-17',
    publishTime: '1:00 PM',
    articleImage:
        'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
        'value':
            'data:image/png;base64,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',
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
        'https://images.unsplash.com/photo-1557862921-37829c790f19?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    publishDate: '2024-10-16',
    publishTime: '3:00 PM',
    articleImage:
        'https://images.unsplash.com/photo-1667984390527-850f63192709?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xvdWQlMjBjb21wdXRpbmd8ZW58MHwwfDB8fHww',
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
        'value':
            'https://plus.unsplash.com/premium_photo-1683141114059-aaeaf635dc05?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
