import 'user_model.dart';

class Message{
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread
  });
}

//You - Current User
final User currentUser = User(
  id : 0,
  name: 'Current User',
  imageUrl: 'asset/images/chatting/greg.jpg'
);

final User greg = User(
    id : 1,
    name: 'Greg',
    imageUrl: 'asset/images/chatting/greg.jpg'
);

final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'asset/images/chatting/james.jpg',
);
final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'asset/images/chatting/john.jpg',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'asset/images/chatting/olivia.jpg',
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'asset/images/chatting/sam.jpg',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'asset/images/chatting/sophia.jpg',
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'asset/images/chatting/steven.jpg',
);

//Favorite Contacts
List<User> favorites = [sam, steven, olivia, john, greg];

//Example Chats on Home Screen
List<Message> chats =[
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

//Example Message in chat screen
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];

