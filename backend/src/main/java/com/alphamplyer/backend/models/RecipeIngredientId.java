package com.alphamplyer.backend.models;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class RecipeIngredientId implements Serializable {

    @Column(name = "ingredient_id")
    private Long ingredientId;

    @Column(name = "recipe_id")
    private Long recipeId;

    public RecipeIngredientId() { }

    public RecipeIngredientId(Long ingredientId, Long recipeId) {
        this.ingredientId = ingredientId;
        this.recipeId = recipeId;
    }

    public Long getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(Long ingredientId) {
        this.ingredientId = ingredientId;
    }

    public Long getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(Long recipeId) {
        this.recipeId = recipeId;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;

        if (obj == null || getClass() != obj.getClass())
            return false;

        RecipeIngredientId that = (RecipeIngredientId) obj;
        return Objects.equals(ingredientId, that.ingredientId) &&
                Objects.equals(recipeId, that.recipeId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ingredientId, recipeId);
    }
}