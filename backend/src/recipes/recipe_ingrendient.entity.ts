import { Ingredient } from 'src/ingredients/ingredient.entity';
import { Column, Entity, JoinColumn, ManyToOne, PrimaryColumn } from 'typeorm';
import { Recipe } from './recipe.entity';

@Entity("recipe_ingredients")
export class RecipeIngredient {
  @PrimaryColumn({ type: 'uuid', name: 'recipe_id' })
  @ManyToOne(() => Recipe, (recipe) => recipe.ingredients, { onDelete: 'CASCADE' })
  @JoinColumn([{ name: 'recipe_id', referencedColumnName: 'id'}])
  recipe: Recipe;

  @PrimaryColumn({ type: 'integer', name: 'ingredient_id' })
  @ManyToOne(() => Ingredient, (ingredient) => ingredient.recipes, { onDelete: 'NO ACTION'})
  @JoinColumn([{ name: 'ingredient_id', referencedColumnName: 'id' }])
  ingredient: Ingredient;

  @Column({ type: 'decimal', precision: 9, scale: 2, default: 1.00 })
  quantity: number;
}