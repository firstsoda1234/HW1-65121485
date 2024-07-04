void main() {
  Library library = Library();
  // Menu System
  menuSystem(library);
}


int bookAdded = 0;
int memberAdded = 0;
double manageBooksSubChoice = 1.1; // เมนูย่อย
double manageMembersSubChoice = 2.1; // เมนูย่อย
double manageMembersBorrowSubChoice = 3.1; // เมนูย่อย
String BK_ID = ""; // ทำงานร่วมกับ เมนูหลัก 3
String MB_ID = ""; // ทำงานร่วมกับ เมนูหลัก 3
String BK_isbn_update = ""; // ทำงานร่วมกับ เมนูหลัก 1 / 1.2
String MB_ID_update = ""; // ทำงานร่วมกับ เมนูหลัก 1 / 1.2
String BK_isbn_del = ""; // ทำงานร่วมกับ เมนูหลัก 1 / 1.3
String MB_isbn_del = ""; // ทำงานร่วมกับ เมนูหลัก 2 / 2.3
Map<String, dynamic> bkUpdate = {
  "Newtitle": null, // Default type String
  "Newauthor": null, // Default type String
  "Newcopies": null, // Default type int
};
Map<String, dynamic> mbUpdate = {
  "name": null, // Default type String
};

void menuSystem(Library library){
  print('-' * 25);

  void displayMenuSystem() {
    print('Library System Menu:');
    print('1. Manage Books');
    print('2. Manage Members');
    print('3. Borrow and Return Books');
    print('4. Exit');
  }

  displayMenuSystem();

  var choiceSelect = 1;
  print('Select:$choiceSelect');

  var libraryMenu = [1, 2, 3];

  var booksOrder = [
    1.1,
    1.1,
    1.1,
    1.1,
    1.1,
    1.1,
  ]; // ลำดับการทำงานของหนังสือ
  var membersOrder = [2.1, 2.1, 2.1, 2.1]; // ลำดับการทำงานของสมาชิค

  // วิชาการ 3 227
  for (var option in libraryMenu) {
    switch (option) {
      case 1:
        print('-' * 50);
        print("สาธิตการจัดการหนังสือ");
        int count = option;
        for (var bo in booksOrder) {
          manageBooksSubChoice = bo;
          manageBooksMenu(library); // Book manage
          print("Continue press: Y, Cancer N");
          count++;
          if (booksOrder.length == count)
            print("Select: N");
          else
            print("Select: Y");
        }
        print('-' * 50);
        break;
      case 2:
        print('-' * 50);
        print("สาธิตการจัดการสมาชิค");
        displayMenuSystem();
        choiceSelect = option;
        print('Select:$choiceSelect');
        int count = 0;
        for (var mb in membersOrder) {
          manageMembersSubChoice = mb;
          manageMembersMenu(library);
          print("Continue press: Y, Cancer N");
          count++;
          if (membersOrder.length == count)
            print("Select: N");
          else
            print("Select: Y");
        }
        print('-' * 50);
      case 3:
        // --------------- Borrow and Return ---------------------
        print('-' * 50);
        var br_rt = [3.1, 3.1, 3.1, 3.1, 3.1, 3.1, 3.1, 3.2, 3.2];
        var br_rt_inputData = [
          {"mbid": "M003", "bkid": "9780747532743"},
          {"mbid": "M003", "bkid": "9783806741360"},
          {"mbid": "M001", "bkid": "9780452284241"},
          {"mbid": "M004", "bkid": "9780743273565"},
          {"mbid": "M002", "bkid": "9783806741360"},
          {"mbid": "M001", "bkid": "9783806741360"},
          {"mbid": "M004", "bkid": "9780452284241"},
          {"mbid": "M001", "bkid": "9783806741360"},
          {"mbid": "M003", "bkid": "9783806741360"},
        ]; // Data demo for borrow and return of members
        print("สาธิตการยืมและคืน");
        displayMenuSystem();
        choiceSelect = option;
        int count = 0;
        print('Select:$choiceSelect');
        br_rt.asMap().forEach((index, value) {
          // print('Index: $index, Value: $value');
          switch (value) {
            case 3.1:
              MB_ID = br_rt_inputData[index]['mbid'] ?? "";
              BK_ID = br_rt_inputData[index]['bkid'] ?? "";
              manageMembersBorrowSubChoice = value; // Borrow or Return Option
              borrowReturnBooksMenu(library);
              count++;
              print("Continue press: Y, Cancer N");
              if (br_rt.length != index + 1) {
                print("Select: Y");
              } else
                print("Select: N");
            case 3.2:
              MB_ID = br_rt_inputData[index]['mbid'] ?? "";
              BK_ID = br_rt_inputData[index]['bkid'] ?? "";
              manageMembersBorrowSubChoice = value; // Borrow or Return Option
              borrowReturnBooksMenu(library);
              if (br_rt.length != index + 1) {
                print("Select: Y");
              } else
                print("Select: N");
              break;
            default:
              print('Invalid subchoice. Please try again.');
          }
          print('-' * 50);
        });
        break;
      case 4:
          print("Program is done");
          break;
      default:
        print('Invalid choice. Please try again.');
    }
  }

  // -------------------------------------------------------------
  // Update book with key
  displayMenuSystem();
  choiceSelect = 1;
  print('Select:$choiceSelect');
  manageBooksSubChoice = 1.2; // choice selection
  BK_isbn_update = "9780452284241"; // book ref
  bkUpdate = {"Newtitle": "XXYYZZ", "Newauthor": "abc", "Newcopies": 99};
  manageBooksMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: Y");

  print('Select:$choiceSelect');
  manageBooksSubChoice = 1.2; // choice selection
  BK_isbn_update = "9780451524935"; // book ref
  bkUpdate = {"Newtitle": "Big brother", "Newauthor": "Arlong"};
  manageBooksMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: N");

  print('-' * 50);

  // -------------------------------------------------------------
  // Update member with key
  displayMenuSystem();
  choiceSelect = 2;
  print('Select:$choiceSelect');
  manageMembersSubChoice = 2.2;
  mbUpdate = {"name": "Babyworld"}; // ข้อมูลสำหรับอัพเดท
  MB_ID_update = "M004";
  manageMembersMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: Y");

  manageMembersSubChoice = 2.2;
  mbUpdate = {"name": "Obox"}; // ข้อมูลสำหรับอัพเดท
  MB_ID_update = "M003";
  manageMembersMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: N");
  print('-' * 50);
  // -------------------------------------------------------------

  // -------------------------------------------------------------
  // Delete the book
  displayMenuSystem();
  choiceSelect = 1;
  print('Select:$choiceSelect');
  manageBooksSubChoice = 1.3; // choice selection
  BK_isbn_del = "9780452284241"; // book ref
  manageBooksMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: Y");

  // Read
  manageBooksSubChoice = 1.4; // choice selection
  manageBooksMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: Y");

  manageBooksSubChoice = 1.3; // choice selection
  BK_isbn_del = "9780747532743"; // book ref
  manageBooksMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: Y");

  manageBooksSubChoice = 1.4; // choice selection
  manageBooksMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: N");

  // -------------------------------------------------------------
  // Delete the member
  displayMenuSystem();
  choiceSelect = 2;
  print('Select:$choiceSelect');
  manageMembersSubChoice = 2.3;
  MB_isbn_del = "M004";
  manageMembersMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: Y");

  // Read
  manageMembersSubChoice = 2.4;
  manageMembersMenu(library);
  print("Continue press: Y, Cancer N");
  print("Select: N");

  displayMenuSystem();
  choiceSelect = 4;
  print('Select:$choiceSelect');

  // findMemberBorrowBooks(library);
  // findBooks(library);
  if(choiceSelect == 4){
    print("End of program");
  }
}

class Book {
  String _title; // title book's name
  String _author; // book author
  String _isbn; // ISBN number
  int _copies; // number of books that have

  // Constructor (__init__ equivalent in Dart)
  Book(this._title, this._author, this._isbn, this._copies);

  // Getter for title
  String getTitle() => _title;

  // Getter for author
  String getAuthor() => _author;

  // Getter for isbn
  String getIsbn() => _isbn;

  // Getter for copies
  int getCopies() => _copies;

  // Setter for title
  setTitle(String title) {
    _title = title;
  }

  // Setter for author
  setAuthor(String author) {
    _author = author;
  }

  // Setter for isbn
  setIsbn(String isbn) {
    _isbn = isbn;
  }

  // Setter for copies
  setCopies(int copies) {
    if (copies < 0) {
      print("Can't not set Copies of the book!");
    } else {
      _copies = copies;
    }
  }

  // Method to borrow a book
  bool borrowBook() {
    if (_copies > 0) {
      print('-- Before:Book borrowed: $_title. Remaining copies: $_copies --');
      _copies--;
      print('-- After:Book borrowed: $_title. Remaining copies: $_copies --');
      return true; // Successfully borrowed
    } else {
      print('No copies of $_title available to borrow.');
      return false; // Unable to borrow
    }
  }

  // Method to return a book
  void returnBook() {
    print('-- Before Book returned: $_title. Total copies: $_copies -- ');
    _copies++;
    print('-- After Book returned: $_title. Total copies: $_copies -- ');
  }

  // Read book information
  void readBookInfo() {
    print('Title: $_title\n'
        'Author: $_author\n'
        'ISBN: $_isbn\n'
        'Copies: $_copies');
  }

  // Method to update book information
  void updateBookInfo(
      {String? title, String? author, String? isbn, int? copies}) {
    if (copies != null) {
      // Every time to update copies Every books have to return back.
      if (copies < 0) {
        print('Can not update because copies < 0');
        return;
      }
    }
    _title = title ?? getTitle();
    _author = author ?? getAuthor();
    _isbn = isbn ?? getIsbn();
    _copies = copies ?? getCopies();

    print('--- Book information updated: ---');
    print('Title: $_title');
    print('Author: $_author');
    print('ISBN: $_isbn');
    print('Copies available: $_copies');
    print('-----------------------------');
  }
}

class Member {
  String _name; // private variable
  final String _memberId; // private variable
  List<Book> _borrowedBooks; // private variable to hold borrowed books

  // Constructor (__init__ equivalent in Dart)
  Member(this._name, this._memberId) : _borrowedBooks = [];

  // Getter for name
  String get name => _name;

  // Getter for memberId
  String get memberId => _memberId;

  // Getter for borrowedBooks
  List<Book> get borrowedBooks => _borrowedBooks;

  // Setter for name
  setName(String newName) {
    _name = newName;
  }

  // Method to borrow a book
  void borrowBook(Book book) {
    bool br = book.borrowBook();
    if (br) {
      _borrowedBooks.add(book);
      print('$_name borrowed the book: ${book.getTitle()}');
    } else {
      print("Can't borrowed the book: ${book.getTitle()}");
    }
  }

  // Method to return a book
  void returnBook(Book book) {
    if (_borrowedBooks.contains(book)) {
      _borrowedBooks.remove(book);
      book.returnBook();
    } else {
      print('$_name does not have the book: ${book.getTitle()}');
    }
  }

  // Create (for demonstration, this would be part of a library)
  static Member createMember(String name, String memberId) {
    return Member(name, memberId);
  }

  // Read (simply return information about the member)
  void readMemberInfo() {
    print('Name: $_name');
    print('Member ID: $_memberId');
    print(
        'Borrowed Books: ${this._borrowedBooks.isEmpty ? "ไม่มีรายการที่ยืม" : this._borrowedBooks.map((book) => book.getTitle()).join(', ')}');
  }

  // Method to Update member information
  void updateMemberInfo({String? name, List<Book>? borrowedBooks}) {
    setName(name ?? _name);
    _borrowedBooks = borrowedBooks ?? _borrowedBooks;

    print('Member information updated:\n'
        'Name: $_name\n'
        'Borrowed Books: ${_borrowedBooks.map((book) => book.getTitle()).join(', ')}');
  }

  // Delete member (for demonstration, this would be part of a library or database system in practice)
  void deleteMember(Member member) {
    // In practice, this would remove the member from a list or database
    print('Member deleted: ${member.name}');
  }

//   UR
}

class Library {
  List<Book>
      _books; // private variable to hold the list of books in the library
  List<Member> _members; // private variable to hold the list of members

  // Constructor (__init__ equivalent in Dart)
  Library()
      : _books = [],
        _members = [];

  // Getter for books
  List<Book> get books => _books;

  // Getter for members
  List<Member> get members => _members;

  // Method to add a book to the library
  void addBook(Book book) {
    _books.add(book);
    print('Added book: ${book.getTitle()} to the library.');
  }

  // Method to remove a book from the library
  void removeBook(Book book) {
    if (_books.contains(book)) {
      _books.remove(book);
      print('Removed book: ${book.getTitle()} from the library.');
    } else {
      print('Book: ${book.getTitle()} not found in the library.');
    }
  }

  // Method to register a member
  void registerMember(Member member) {
    _members.add(member);
    print('Successfully Registered member: ${member.name}');
  }

  // Method for a member to borrow a book
  void borrowBook(String memberId, String isbn) {
    Book? book = _findBookByIsbn(isbn);
    Member? member = _findMemberById(memberId);

    // Logic to vertify book and member
    if (book != null && member != null) {
      // Case where both book and member exist
      print('Borrowing book ${book.getTitle()} by ${member.name}');
      // Logic to borrow the book by the member
      member.borrowBook(book);
    } else {
      // Handle the case where either book or member or both are not found
      if (book == null) {
        print('Book with ISBN $isbn not found.');
      }
      if (member == null) {
        print('Member with memberId $memberId not found.');
      }
    }
  }

  // Method for a member to return a book
  void returnBook(String memberId, String isbn) {
    Book? book = _findBookByIsbn(isbn);
    Member? member = _findMemberById(memberId);

    // Logic to vertify book and member
    if (member != null && book != null) {
      member.returnBook(book);
      print('Member: ${member.name} returned book: ${book.getTitle()}');
    } else {
      if (member == null) {
        print('Member with ID: $memberId not found.');
      }
      if (book == null) {
        print('Book with ISBN: $isbn not found in the library.');
      }
    }
  }

  // Method to delete a book from the library by ISBN
  void deleteBook(String isbn) {
    Book? book = _findBookByIsbn(isbn);
    if (book == null) {
      print('Book with ISBN: $isbn not found in the library.');
      return;
    }
    _books.remove(book);
    print(
        'Book with ISBN $isbn, name ${book.getTitle()} has been removed from the library.');
  }

  // Method to delete a book from the library by ISBN
  void deleteMember(String memberId) {
    Member? member = _findMemberById(memberId);
    if (member == null) {
      print('Member with ID: $memberId not found in the library.');
      return;
    }
    _members.remove(member);
    print('Member with ID $memberId has been removed from the library.');
  }

  // Method to Update book list from the library
  void updateBook(String isbn,
      {String? newTitle, String? newAuthor, int? newCopies}) {
    Book? book = _findBookByIsbn(isbn);

    if (book == null) {
      print('Book with ISBN: $isbn not found in the library.');
      return;
    }
    book.updateBookInfo(title: newTitle, author: newAuthor, copies: newCopies);
    print('Book with ISBN $isbn has been updated.');
  }

  // Method to update a member in the library
  void updateMember(String memberId,
      {String? newName, List<Book>? newBorrowedBooks}) {
    Member? member = _findMemberById(memberId);
    if (member == null) {
      print('Member with ID: $memberId not found in the library.');
      return;
    }

    member.updateMemberInfo(name: newName, borrowedBooks: newBorrowedBooks);
    print('Member with ID $memberId has been updated.');
  }

  // Method to read book list from the library
  void readBookList() {
    print("Display books");
    if (books.isEmpty) {
      print('No any book in library');
      return;
    }
    int index = 1;
    for (Book book in books) {
      print('*' * 25);
      print('หนังสือเล่มที่: ${index++}');
      book.readBookInfo();
      print('*' * 25);
    }
  }

  // Method to read member list from the library
  void readMemberList() {
    print("READ Member List");
    if (members.isEmpty) {
      print('No members in library');
      return;
    }
    int index = 1;
    for (Member member in members) {
      print('*' * 25);
      print('คนที่: ${index++}');
      member.readMemberInfo();
      print('*' * 25);
    }
  }

  // Method to update member list from the library

  // Method to update book list from the library

  // Private method to find ISBN of book
  Book? _findBookByIsbn(String isbn) {
    try {
      return _books.firstWhere((b) => b.getIsbn() == isbn);
    } catch (e) {
      return null;
    }
  }

  // Private method to find a member by ID
  Member? _findMemberById(String memberId) {
    try {
      return _members.firstWhere((m) => m.memberId == memberId);
    } catch (e) {
      return null;
    }
  }
//   RC
}

void manageBooksMenu(Library library) {
  print('Sub Menu of 1');
  print('1.1 Add a New Book');
  print('1.2 Update Book Information');
  print('1.3 Delete a Book');
  print('1.4 View All Books');
  print('1.5. Exit');
  print('Enter your choice: ');

  double choice = manageBooksSubChoice;
  print('Select: $choice');

  switch (choice) {
    case 1.1:
      bookAdded += 1;
      bookData[bookAdded - 1];
      // print("bk-name: ${bookData[bookAdded - 1]['title']}");
      if (bookData[bookAdded - 1]['used'] == false) {
        Book bk = new Book(
          bookData[bookAdded - 1]['title'],
          bookData[bookAdded - 1]['author'],
          bookData[bookAdded - 1]['isbn'],
          bookData[bookAdded - 1]['copies'],
        );
        bookData[bookAdded - 1]['used'] = true;
        library.addBook(bk);
      }
      break;
    case 1.2:
      // Update book information
      print('Enter ISBN of the book to update: ');
      // List<int> selectIndexToUpdate = [0, 1, 2, 3];
      String isbn = BK_isbn_update ?? "";
      print("isbn:$isbn");
      library.updateBook(
        isbn,
        newTitle: bkUpdate['Newtitle'],
        newAuthor: bkUpdate['Newauthor'],
        newCopies: bkUpdate['Newcopies'],
      );
      bkUpdate = {"Newtitle": null, "Newauthor": null, "Newcopies": null};
      BK_isbn_update = "";
      break;
    case 1.3:
      // Delete a book
      String isbn = BK_isbn_del ?? "";
      library.deleteBook(isbn);
      bookData[bookAdded - 1]['used'] = false; // boo
      break;
    case 1.4:
      // View all books
      library.readBookList();
      break;
    default:
      print('Invalid choice. Please try again.');
  }
}

void manageMembersMenu(Library library) {
  print('Sub Menu of 2');
  print('2.1 Register a New Member');
  print('2.2 Update Member Information');
  print('2.3 Delete a Member');
  print('2.4 View All Members');
  print('Enter your choice: ');

  double choice = manageMembersSubChoice;
  print('Select: $choice');

  switch (choice) {
    case 2.1:
      // Register a new member
      memberAdded += 1;
      if (memberData[memberAdded - 1]['used'] == false) {
        Member mb = Member(memberData[memberAdded - 1]['name'],
            memberData[memberAdded - 1]['memberId']);
        library.registerMember(mb);
        memberData[memberAdded - 1]['used'] == true;
      } else {
        print("Can't Add member!");
      }
      break;
    case 2.2:
      // Update member information
      print('Enter MemberID to update: ');
      String mbID = MB_ID_update;
      library.updateMember(mbID, newName: mbUpdate["name"]);
      mbUpdate = {"name": null};
      MB_ID_update = "";
      break;
    case 2.3:
      // Delete a member
      String mbID = MB_isbn_del ?? "";
      library.deleteMember(mbID);
      memberData[memberAdded - 1]['used'] = false; // boo
      MB_isbn_del = "";
      break;
    case 2.4:
      // View all members
      library.readMemberList();
      break;
    default:
      print('Invalid choice. Please try again.');
  }
}

void borrowReturnBooksMenu(Library library) {
  print('3.1 Borrow a Book');
  print('3.2 Return a Book');
  double choice = manageMembersBorrowSubChoice;
  print('Enter your choice: $choice');

  switch (choice) {
    case 3.1:
      // Borrow a book
      String mbID = MB_ID;
      String bkID = BK_ID;
      print('Enter MemberID: $mbID');
      print('Enter ISNB: $bkID');
      library.borrowBook(mbID, bkID);
      break;
    case 3.2:
      // Return a book
      String mbID = MB_ID;
      String bkID = BK_ID;
      print('Enter MemberID: $mbID');
      print('Enter ISNB: $bkID');
      library.returnBook(mbID, bkID);
      break;
    default:
      print('Invalid choice. Please try again.');
  }
}

// Demo Member data
List<Map<String, dynamic>> memberData = [
  {"name": "Alice", "memberId": "M001", "used": false},
  {"name": "Bob", "memberId": "M002", "used": false},
  {"name": "John", "memberId": "M003", "used": false},
  {"name": "Martin", "memberId": "M004", "used": false},
];

// Demo bookData list
List<Map<String, dynamic>> bookData = [
  {
    "title": "The Very Hungry Caterpillar",
    "author": "Eric Carle",
    "isbn": "9783806741360",
    "copies": 3,
    "used": false
  },
  {
    "title": "Harry Potter and the Sorcerer's Stone",
    "author": "J.K. Rowling",
    "isbn": "9780747532743",
    "copies": 5,
    "used": false
  },
  {
    "title": "The Great Gatsby",
    "author": "F. Scott Fitzgerald",
    "isbn": "9780743273565",
    "copies": 10,
    "used": false
  },
  {
    "title": "1984",
    "author": "George Orwell",
    "isbn": "9780451524935",
    "copies": 10,
    "used": false
  },
  {
    "title": "Brave New World",
    "author": "Aldous Huxley",
    "isbn": "9780060850524",
    "copies": 20,
    "used": false
  },
  {
    "title": "Animal Farm",
    "author": "George Orwell",
    "isbn": "9780452284241",
    "copies": 2,
    "used": false
  },
];

// For testing only

// test finding the member borrowing books
void findMemberBorrowBooks(Library library) {
  for (Member member in library.members) {
    if (member._borrowedBooks.isNotEmpty) {
      print('*' * 25);
      member.readMemberInfo();
      print('*' * 25);
    }
  }
}

void findBooks(Library library) {
  for (var entry in library.books.asMap().entries) {
    int index = entry.key + 1;
    Book book = entry.value;
    print('#' * 25);
    print('หนังสือเล่มที่: $index');
    book.readBookInfo();
    print('#' * 25);
  }
}

// End Testing
