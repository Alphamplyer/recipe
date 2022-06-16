package com.alphamplyer.backend.models;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;

@Embeddable
public class RecipeStep {
    @Column(name = "number", nullable = false)
    private Integer number;

    @Column(name = "content", nullable = false, length = 2048)
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}