import 'dart:io';

main() {
  Book EditBook = Book(); // Object Book . (add,delete,modify,search) => manager
  Book SeSaBook = Book(); // Object Book . (search,sale) => casher

  Library.books = [
    // Library , static List books .
    {
      // Data for book number 1
      "id": 1,
      "title": "Start with why",
      "author": "Simon Sinek",
      "price": 80.0,
      "quantity": 13
    },
    {
      // Data for book number 2
      "id": 2,
      "title": "But how do it know",
      "author": "J. Clark Scott",
      "price": 59.9,
      "quantity": 22
    },
    {
      // Data for book number 3
      "id": 3,
      "title": "Clean Code",
      "author": "Robert Cecil Martin",
      "price": 50.0,
      "quantity": 5
    },
    {
      // Data for book number 4
      "id": 4,
      "title": "Zero to One",
      "author": "Peter Thiel",
      "price": 45.0,
      "quantity": 12
    },
    {
      // Data for book number 5
      "id": 5,
      "title": "You don't know JS",
      "author": "Kyle Simpson",
      "price": 39.9,
      "quantity": 9
    }
  ];

  print("Welcome to us program !");

  print("are you manager or casher ? ");
  print("Enter your position : ");
  var position = stdin.readLineSync();
  if (position!.toLowerCase() == "casher") {
    print("You can search about book in library and sale any book ");
    print(
        "1- For search by id number .\n 2- For search by title of book .\n 3- For search by name of author.\n 4- For sale books and print bill .\n ");
    print("Enter your chose : ");
    int? switchPo = int.parse(stdin.readLineSync()!);
    switch (switchPo) {
      case 1:
        SeSaBook.serchBooksId(
            Library.books); // if you want search by id number .
        break;
      case 2:
        SeSaBook.serchBooksTi(
            Library.books); // if you want search by title of book .
        break;
      case 3:
        SeSaBook.serchBooksAuth(
            Library.books); // if you want search by name of author .
        break;
      case 4:
        SeSaBook.saleBook(Library.books);
        break;
      default:
        "Your value is invalid";
    }
  } else if (position.toLowerCase() == "manager") {
    int? numOption; // declare value for use switch .
    print(
        "You can edit the books , add or delete or modify any book and you can search");
    print(
        "1 - For add book to library \n.2 - For Delete book from library \n.3- For Modify book in library \n. ");
    print(
        "4- For search by id number .\n 5- For search by title of book .\n 6- For search by name of author.\n");
    print("chose from options : ");
    numOption = int.parse(stdin.readLineSync()!);
    switch (numOption) {
      case 1:
        EditBook.addBook(Library.books); // If you want add book .
        break;
      case 2:
        EditBook.deleteBook(Library.books); // If you want delete book.
        break;
      case 3:
        EditBook.modifyBook(Library.books); // If you want modify book.
        break;
      case 4:
        SeSaBook.serchBooksId(
            Library.books); // if you want search by id number .
        break;
      case 5:
        SeSaBook.serchBooksTi(
            Library.books); // if you want search by title of book .
        break;
      case 6:
        SeSaBook.serchBooksAuth(
            Library.books); // if you want search by name of author .
        break;
      default:
        "Your value is invalid";
    }
  } else {
    print("good bye ");
    exit;
  }
  print(
      "------------------------------**********------------------------------");
      
}

abstract class Library {
  static List? books;

  void serchBooksId(books);

  void serchBooksTi(books);

  void serchBooksAuth(books);
}    

class Book extends Library {
  int? id;
  String? title;
  String? author;
  double? price;
  int? quantity;

  Book({this.id, this.title, this.author, this.price, this.quantity});

  @override 
  void serchBooksId(books) {
    // method for search by id number .
    print("Enter id number for search the book .");
    int? num = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < books.length; i++) {
      if (num == books[i]["id"]) {
        print(books[i]);
      }
    }
  }

  @override
  void serchBooksTi(books) {
    // method for search by title of book.
    print("Enter title of book for search the book .");
    var titll = stdin.readLineSync();

    for (int i = 0; i < books.length; i++) {
      // For Loop for search the title the book.
      if (titll == books[i]["title"]) {
        print(books[i]);
      }
    }
  }

  @override
  void serchBooksAuth(books) {
    // method for search by name of author .
    print("Enter name of author for search the book .");
    var Authors = stdin.readLineSync();

    for (int i = 0; i < books.length; i++) {
      if (Authors == books[i]["author"]) {
        print(books[i]);
      }
    }
  }

  void addBook(books) {
    // method for add book .
    print("This service for add book");
    print("Enter id number for new book.");
    int? idd = int.parse(stdin.readLineSync()!);
    print("Enter Title for new book .");
    var Ti = stdin.readLineSync();
    print("Enter Name of author for new book .");
    var Ath = stdin.readLineSync();
    print("Enter Price for new book .");
    int? Pr = int.parse(stdin.readLineSync()!);
    print("Enter Quantity for new book .");
    int? Quan = int.parse(stdin.readLineSync()!);

    books!.add(
        {"id": idd, "title": Ti, "author": Ath, "price": Pr, "quantity": Quan});

    print("Enter 1 for see the list of books in library");
    int? numOut = int.parse(stdin.readLineSync()!);
    if (numOut == 1) {
      print(books);
    } else {
      print("Ok thanks ");
    }
  }

  void deleteBook(books) {
    // method for delete book.
    print("This service for delete book");
    print("Enter id of book for delete ...");
    int? idd = int.parse(stdin.readLineSync()!); // enter id number for delete .
    books!.removeAt(idd - 1);
    print("If you want display the books after deleted enter 1");
    int? numDis =
        int.parse(stdin.readLineSync()!); // number for display the list .
    if (numDis == 1) {
      // Dis == display .
      print(books);
    } else {
      print("Ok thanks");
    }
  }

  void modifyBook(books) {
    print("This service for modify book");
    print("Enter id number of any book for modify the book");
    int? modId = int.parse(
        stdin.readLineSync()!); // number for fetch the data of id entered .
    // id number .

    for (int i = 0; i < books.length; i++) {
      if (modId == books[i]["id"]) {
        print(books[i]);
      }
    }

    print(
        "1- For modify (id) .\n 2- For modify (Title) .\n 3- For modify (Author) .\n 4- For modify (price).\n 5- For modify (quantity).\n");
    print("Enter your chose for modify : ");
    int? SwModi = int.parse(stdin.readLineSync()!);
    switch (SwModi) {
      case 1:
        print("enter new id :");
        books[modId - 1]["id"] = int.parse(stdin.readLineSync()!);
        break;
      case 2:
        print("enter new title :");
        books[modId - 1]["title"] = stdin.readLineSync();
        ;
        break;
      case 3:
        print("enter new author :");
        books[modId - 1]["author"] = stdin.readLineSync();
        ;
        break;
      case 4:
        print("enter new price :");
        books[modId - 1]["price"] = int.parse(stdin.readLineSync()!);
        ;
        break;
      case 5:
        print("enter new quantity :");
        books[modId - 1]["quantity"] = int.parse(stdin.readLineSync()!);
        ;
        break;
      default:
        "Your value is invalid ";
    }
    print("If you want print list of books after modifing enter 1 ");
    int? numPri = int.parse(stdin.readLineSync()!);
    if (numPri == 1) {
      print(books);
    } else {
      print("Ok goodbye");
    }
  }

  void saleBook(books) {
    print("This service for sale books");
    print("Please enter id of book for chek if found or not found");
    int? numChek = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < books.length; i++) {
      if (numChek == books[i]["id"]) {
        print(books[i]);
        print("we have quantity is : ${books[i]["quantity"]}");
      }
    }

    print("Enter the quantity for sale :");
    int? numQuanSale = int.parse(stdin.readLineSync()!);

    int? fechQuan = books[numChek - 1]["quantity"] -
        numQuanSale; // Take the quantity and store in fechQuan.
    books[numChek - 1]["quantity"] = fechQuan;

    print(books[numChek - 1]);

    double? totalPrice =
        (numQuanSale * books[numChek - 1]["price"]!) as double?;
    double? PriceVAT = totalPrice! +
        ((numQuanSale * books[numChek - 1]["price"]!) * 0.15) as double?;

    print(" ******* Library Turki & Osama ******* ");

    print("ID of book is : ${books[numChek - 1]["id"]}");
    print("Title of book is : ${books[numChek - 1]["title"]}");
    print("Name of author is : ${books[numChek - 1]["author"]}");
    print("price of pice ${books[numChek - 1]["price"]}");
    print("Quantity is :${numQuanSale}");
    print("Total price With VAT is : ${PriceVAT}");

    print(" --- Thank you for shopping ! --- ");
  }
}
