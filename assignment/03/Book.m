classdef Book < matlab.mixin.SetGet
    %BOOK a class defining a book in the library
    properties
        Title(1,1) string
        Author (1,1) string
        NumberOfPages (1,1) int16
        ISBN (1,10) int8 {mustBeInRange(ISBN, 0, 9)}
        ISBN13 (1,13) int8 {mustBeInRange(ISBN13,0,9)}
        Rating(1,1) double = 0
        NumberOfRatings(1,1) int64 = 0
        Language(1,1) string {mustBeTextScalar}
        Publisher (1,1) string
    end
    
    methods
        function obj = Book(title, author, varargin)
            %BOOK construct a book with the Title = title, Author = author,
            % additional optional parameters from {NumberOfPages, ISBN,
            % ISBN13, Rating, NumberOfRatings, Language}

            persistent p;

            % The validation is done on setting the class properties so
            % there is no point in validating them explicitly.
            p = inputParser;
            p.FunctionName ='Book';
            addRequired(p, 'title');
            addRequired(p, 'author');
            addParameter(p, 'Publisher', '-');
            addParameter(p, 'NumberOfPages', NaN);
            addParameter(p, 'ISBN', NaN);
            addParameter(p, 'ISBN13', NaN);
            addParameter(p, 'Rating', 0);
            addParameter(p, 'NumberOfRatings', 0);
            addParameter(p, 'Language', '-');

            parse(p, title, author, varargin{:});

            obj.Title = p.Results.title;
            obj.Author = p.Results.author;
            obj.NumberOfPages = p.Results.NumberOfPages;
            obj.ISBN = p.Results.ISBN;
            obj.ISBN13 = p.Results.ISBN13;
            obj.Rating = p.Results.Rating;
            obj.NumberOfRatings = p.Results.NumberOfRatings;
            obj.Language = p.Results.Language;
            obj.Publisher = p.Results.Publisher;

            if (~isnan(obj.Rating) && obj.Rating ~= 0 ) && ...
                (isnan(obj.NumberOfRatings) || 0 == obj.NumberOfRatings)
                error("Suply either both `Rating` and " + ...
                     "`NumberOfRatings` none of them.")
            end
        end
        
        function obj = addRating(obj,rating)
            %ADDRATING Add a rating for the book
            arguments
                obj
                rating (1,1) int8 {mustBeInRange(rating, 0, 5)}
            end
            obj.Rating = ((obj.Rating * double(obj.NumberOfRatings)) + double(rating))/(double(obj.NumberOfRatings) + 1);
            obj.NumberOfRatings = obj.NumberOfRatings + 1;
        end
    end
end

