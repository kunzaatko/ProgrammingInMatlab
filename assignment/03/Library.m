classdef Library < matlab.mixin.SetGet
    %LIBRARY A library of books
    properties
        Books = {}
        Name (1,1) string
        Location (1,1) string 
    end
    methods
        function obj = Library(varargin)
            %LIBRARY Construct a library with books
            p = inputParser();
            p.FunctionName = 'Library';
            addOptional(p, 'Books', {});
            addParameter(p, 'Location', "-");
            addParameter(p, 'Name', "-");

            parse(p,varargin{:});
            obj.Books = p.Results.Books;
            obj.Location = p.Results.Location;
            obj.Name = p.Results.Name;
        end
        
        function obj = addBook(obj,book, varargin)
            % ADDBOOK add a book to the library with varargin added to
            % BookEntry initialization
            book = BookEntry(book,varargin{:});
            obj.Books = [obj.Books(:)' {book}];
        end

        function obj = removeBook(obj,book)
            % REMOVEBOOK remove a book from the library
            for entry_ind=1:size(obj.Books,2)
                if obj.Books{entry_ind}.Book == book
                    obj.Books = [obj.Books(1:entry_ind-1) obj.Books(entry_ind+1:end)];
                    break;
                end
            end
        end

        function obj = checkoutBook(obj, book)
            % CHECKOUTBOOK checkout a book from the library
            for entry_ind=1:size(obj.Books,2)
                if obj.Books{entry_ind}.Book == book
                    obj.Books{entry_ind} = obj.Books{entry_ind}.checkoutBook();
                    break;
                end
            end
        end

        function obj = returnBook(obj, book)
            % RETURNBOOK return a book
            for entry_ind=1:size(obj.Books,2)
                if obj.Books{entry_ind}.Book == book
                    obj.Books{entry_ind} = obj.Books{entry_ind}.returnBook();
                    break;
                end
            end
        end
    end
end

