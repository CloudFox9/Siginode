import 'User.dart';
import 'SocketUtils.dart';

class G {
  // Socket
  static SocketUtils socketUtils;
  static List<User> dummyUsers;

  // Logged In User
  static User loggedInUser;

  // Single Chat - To Chat User
  static User toChatUser;

  static initSocket() {
    if (null == socketUtils) {
      socketUtils = SocketUtils();
    }
  }

  static void initDummyUsers() {
    User userA = new User(id: 1000, name: 'A', email: 'testa@gmail.com');
    User userB = new User(id: 1001, name: 'B', email: 'testb@gmail.com');
    User userc = new User(id: 1002, name: 'C', email: 'testa@gmail.com');
    User userD = new User(id: 1003, name: 'D', email: 'testb@gmail.com');
    User userE = new User(id: 1004, name: 'E', email: 'testa@gmail.com');
    User userF = new User(id: 1005, name: 'F', email: 'testb@gmail.com');
    dummyUsers = List<User>();
    dummyUsers.add(userA);
    dummyUsers.add(userB);
    dummyUsers.add(userc);
    dummyUsers.add(userD);
    dummyUsers.add(userE);
    dummyUsers.add(userF);
  }

  static List<User> getUsersFor(User user) {
    List<User> filteredUsers = dummyUsers
        .where((u) => (!u.name.toLowerCase().contains(user.name.toLowerCase())))
        .toList();
    return filteredUsers;
  }
}
