//TASK 1
import Foundation

class BankAccount {
    static var accountNumbers = Set<String>()

    var accountNumber: String
    var accountOwner: String
    var balance: Double

    init() {
        print("Введите номер счета:")
        guard let accountNumber = readLine(), !accountNumber.isEmpty else {
            fatalError("Номер счета не может быть пустым.")
        }
        guard !BankAccount.accountNumbers.contains(accountNumber) else {
            fatalError("Номер счета должен быть уникальным.")
        }

        print("Введите имя владельца счета:")
        guard let accountOwner = readLine(), !accountOwner.isEmpty else {
            fatalError("Имя владельца счета не может быть пустым.")
        }

        print("Введите начальный баланс:")
        guard let initialBalanceInput = readLine(), let initialBalance = Double(initialBalanceInput), initialBalance >= 0 else {
            fatalError("Начальный баланс должен быть числом и не может быть отрицательным.")
        }

        self.accountNumber = accountNumber
        self.accountOwner = accountOwner
        self.balance = initialBalance

        BankAccount.accountNumbers.insert(accountNumber)
    }

    func deposit() {
        print("Введите сумму для внесения:")
        if let input = readLine(), let amount = Double(input), amount > 0 {
            balance += amount
            print("Внесение средств успешно. Новый баланс: \(balance)")
        } else {
            print("Неверный ввод. Пожалуйста, введите положительное число.")
        }
    }

    func withdraw() {
        print("Введите сумму для снятия:")
        if let input = readLine(), let amount = Double(input), amount > 0 && amount <= balance {
            balance -= amount
            print("Снятие средств успешно. Новый баланс: \(balance)")
        } else {
            print("Неверный ввод или недостаточно средств.")
        }
    }

    func getBalance() -> Double {
        return balance
    }

    func displayInfo() {
        print("Номер счета: \(accountNumber)")
        print("Владелец счета: \(accountOwner)")
        print("Текущий баланс: \(balance)")
    }
}

let account1 = BankAccount()
account1.deposit()
account1.withdraw()
account1.displayInfo()


////TASK 2
import Foundation

class Book {
    var title: String
    var author: String
    var year: Int
    var pageCount: Int

    init(title: String, author: String, year: Int, pageCount: Int) {
        self.title = title
        self.author = author
        self.year = year
        self.pageCount = pageCount
    }

    func displayInfo() {
        print("Название: \(title)")
        print("Автор: \(author)")
        print("Год: \(year)")
        print("Количество страниц: \(pageCount)")
        print("--------")
    }
}

class Library {
    var books: [Book] = []

    func addBookManually() {
        print("Введите информацию о книге:")
        print("Название:")
        guard let title = readLine(), !title.isEmpty else {
            print("Ошибка: Название не может быть пустым.")
            return
        }

        print("Автор:")
        guard let author = readLine(), !author.isEmpty else {
            print("Ошибка: Автор не может быть пустым.")
            return
        }

        print("Год:")
        guard let yearInput = readLine(), let year = Int(yearInput), year > 0 else {
            print("Ошибка: Введите корректный год.")
            return
        }

        print("Количество страниц:")
        guard let pageCountInput = readLine(), let pageCount = Int(pageCountInput), pageCount > 0 else {
            print("Ошибка: Введите корректное количество страниц.")
            return
        }

        let newBook = Book(title: title, author: author, year: year, pageCount: pageCount)
        books.append(newBook)
        print("Книга добавлена в библиотеку:")
        newBook.displayInfo()
    }

    func removeBookManually() {
        print("Введите название книги, которую хотите удалить:")
        guard let title = readLine(), !title.isEmpty else {
            print("Ошибка: Название не может быть пустым.")
            return
        }

        if let index = books.firstIndex(where: { book in
            return book.title == title
        }) {
            let removedBook = books.remove(at: index)
            print("Книга удалена из библиотеки:")
            removedBook.displayInfo()
        } else {
            print("Книга не найдена в библиотеке.")
        }
    }

    func displayAllBooks() {
        if books.isEmpty {
            print("Библиотека пуста.")
        } else {
            print("Книги в библиотеке:")
            for book in books {
                book.displayInfo()
            }
        }
    }
}

let library = Library()

while true {
    print("\nВыберите действие:")
    print("1. Добавить книгу")
    print("2. Удалить книгу")
    print("3. Показать все книги")
    print("4. Выйти")

    guard let choiceInput = readLine(), let choice = Int(choiceInput) else {
        print("Ошибка: Введите число.")
        continue
    }

    switch choice {
    case 1:
        library.addBookManually()
    case 2:
        library.removeBookManually()
    case 3:
        library.displayAllBooks()
    case 4:
        exit(0)
    default:
        print("Ошибка: Неверный выбор. Пожалуйста, введите число от 1 до 4.")
    }
}
