import { RecipeIngredient } from 'src/recipes/recipe_ingrendient.entity';
import { Column, Entity, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn, OneToMany } from 'typeorm';

@Entity("ingredients")
export class Ingredient {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'varchar', length: 50, nullable: false })
  name: string;

  @Column({ type: 'varchar', length: 255, name: 'image_url', nullable: false })
  imageUrl: string;

  @Column({ type: 'varchar', length: 26, name: 'seasonal_peaks', default: '0' })
  seasonalPeaks: string;

  @OneToMany(() => RecipeIngredient, (recipeIngredient) => recipeIngredient.ingredient)
  recipes: RecipeIngredient[];

  @CreateDateColumn({ type: 'timestamptz', name: 'created_at' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamptz', name: 'updated_at' })
  updatedAt: Date;
}