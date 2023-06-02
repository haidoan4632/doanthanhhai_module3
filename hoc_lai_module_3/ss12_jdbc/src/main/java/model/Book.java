package model;

public class Book {
    private int id;
    private String title;
    private int pageSize;
    private int idCategory;
    private Category category;

    public Book() {
    }
    public Book(int id, String title, int pageSize,  Category category) {
        this.id = id;
        this.title = title;
        this.pageSize = pageSize;
        this.category = category;
    }

    public Book(int id, String title, int pageSize, int idCategory, Category category) {
        this.id = id;
        this.title = title;
        this.pageSize = pageSize;
        this.idCategory = idCategory;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
