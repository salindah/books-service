package com.bookservice;

import java.util.UUID;

public record Book (UUID id, String title, Integer pages){
}
