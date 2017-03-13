# Blogクラス(集約オブジェクト): 複数のArticleクラスを持つオブジェクト
# Articleクラス(集約オブジェクト内の要素): Blogクラスの個別の要素
# BlogIteratorクラス(外部イーテレータ): Blogの要素Articleにアクセスするためクラス

class Blog
    def initialize
        @articles = []
    end

    def get_article_at(index)
        @articles[index]
    end

    def add_article(article)
        @articles << article
    end

    def length
        @articles.length
    end

    def iterator
        BlogIterator.new(self)
    end
end

class Article
    def initialize(title)
        @title = title
    end

    attr_reader :title
end

class BlogIterator
    def initialize(blog)
        @blog  = blog
        @index = 0
    end

    def has_next?
        @index < @blog.length
    end

    def next_article
        article = self.has_next? ? @blog.get_article_at(@index) : nil
        @index = @index + 1
        article
    end
end

blog = Blog.new
blog.add_article(Article.new("DP1"))
blog.add_article(Article.new("DP2"))
blog.add_article(Article.new("DP3"))
blog.add_article(Article.new("DP4"))

iterator = blog.iterator
while iterator.has_next?
    article = iterator.next_article
    puts article.title
end