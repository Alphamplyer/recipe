import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity("recipe_ingredients")
export class Recipe {
  @PrimaryColumn()
  recipe_id: string;

  @PrimaryColumn()
  ingredient_id: string;

  @Column({ type: 'decimal', precision: 9, scale: 2, default: 1.00 })
  quantity: number;
}