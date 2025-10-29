classdef BookEntry < matlab.mixin.SetGet
    %BOOKENTRY A book entry in the library
    properties
        Book (1,1) Book = Book("-","-")
        NumberOfCopies (1,1) int8
        NumberCheckedOut (1,1) int8
    end
    
    methods
        function obj = BookEntry(book,varargin)
            %BOOKENTRY Construct an instance of this class
            %   Detailed explanation goes here
            p = inputParser();
            p.FunctionName = 'BookEntry';
            addRequired(p,'Book');
            addParameter(p,'NumberOfCopies',1);
            addParameter(p,'NumberCheckedOut',0);

            parse(p,book,varargin{:});
            obj.Book = p.Results.Book;
            obj.NumberOfCopies = p.Results.NumberOfCopies;
            obj.NumberCheckedOut = p.Results.NumberCheckedOut;
        end
        
        function obj = checkoutBook(obj)
            % CHECKOUTBOOK checkout the book
            if obj.NumberCheckedOut == obj.NumberOfCopies
                error("There are no more books to checkout!")
            end
            obj.NumberCheckedOut = obj.NumberCheckedOut + 1;
        end

        function obj = returnBook(obj)
            % RETURNBOOK return the book
            if obj.NumberCheckedOut == 0
                error("The book is not checkedout")
            end
            obj.NumberCheckedOut = obj.NumberCheckedOut - 1;
        end
    end
end

