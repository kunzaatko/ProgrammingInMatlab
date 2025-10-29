% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                                Book                                 %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %


% Creating books
do_computers_think_like_humans = Book("The Emoperor's New Mind", ...
    "Roger Penrose", 'NumberOfPages', 602, 'ISBN13', [9 7 8 ...
    0 1 9 2 8 6 1 9 8 6], 'Language', 'en');
set(do_computers_think_like_humans, 'Publisher', 'Oxford University Press');

harry_potter_in_spanish = Book("Harry Potter y la piedra filosofal", ...
    "Joanne K. Rowling", 'NumberOfPages', 254, 'ISBN13', [9 7 8 ...
    8 4 7 8 8 8 4 4 5 2], 'Language', 'es');
set(harry_potter_in_spanish, 'Publisher', 'Salamandra');

% Rating books
do_computers_think_like_humans = ...
    do_computers_think_like_humans.addRating(5); % this is a great book
do_computers_think_like_humans = ...
    do_computers_think_like_humans.addRating(2); % but some people get scared

harry_potter_in_spanish = harry_potter_in_spanish.addRating(4);

% This is not allowed!
% harry_potter_in_spanish.addRating(6);
% harry_potter_in_spanish.addRating(-1);
% harry_potter_in_spanish.addRating(0.7);


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                              BookEntry                              %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %

% These are entries in the Library
entry_do_computers_think_like_humans = BookEntry(do_computers_think_like_humans);
entry_harry_potter_in_spanish = BookEntry(harry_potter_in_spanish);

% The books are stored inside of the enries
assert(harry_potter_in_spanish == get(entry_harry_potter_in_spanish, 'Book'));

% There is some number of copies in the library (default = 1)
assert(1 == get(entry_harry_potter_in_spanish, 'NumberOfCopies'));

% We can checkout the book
entry_harry_potter_in_spanish = entry_harry_potter_in_spanish.checkoutBook();
assert(1 == get(entry_harry_potter_in_spanish, 'NumberCheckedOut'));

% Checking out more books then are available is not allowed
% entry_harry_potter_in_spanish.checkoutBook();

% We can return the checkedout book
entry_harry_potter_in_spanish = entry_harry_potter_in_spanish.returnBook();
assert(0 == get(entry_harry_potter_in_spanish, 'NumberCheckedOut'));

% Then it is possible to checkout again
entry_harry_potter_in_spanish = entry_harry_potter_in_spanish.checkoutBook();


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
%                               Library                               %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %
lib = Library('Name', "Czech National Library");
set(lib, 'Location', "Prague");
assert(lib.Location == Library('Name', "Czech National Library", 'Location', "Prague").Location);

% We can add books to our library
lib = lib.addBook(harry_potter_in_spanish);
lib = lib.addBook(do_computers_think_like_humans);

% We can remove books from the library
lib = lib.removeBook(do_computers_think_like_humans);
assert(size(lib.Books,2) == 1);
% But it would to remove this book... Lets buy more copies
lib = lib.addBook(do_computers_think_like_humans, "NumberOfCopies", 5);

% We can checkout the books in the library
lib.checkoutBook(harry_potter_in_spanish);
assert(lib.Books{1}.NumberCheckedOut == 1);

% We can only checkout books if they are available so this will fail
% lib.checkoutBook(harry_potter_in_spanish);

% We can return books to the library
lib.returnBook(harry_potter_in_spanish);
