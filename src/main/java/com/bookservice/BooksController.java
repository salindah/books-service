package com.bookservice;

import com.netflix.graphql.dgs.DgsComponent;
import com.netflix.graphql.dgs.DgsQuery;

import java.util.List;
import java.util.UUID;

@DgsComponent
public class BooksController {

    @DgsQuery
    public List<Book> books() {
        System.out.println("Books were fetched");
        return List.of(
                new Book(UUID.randomUUID(), "Game of Thrones", 500),
                new Book(UUID.randomUUID(), "Harry Potter", 300)
        );
    }
}
