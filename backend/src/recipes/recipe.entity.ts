import { Step } from 'src/steps/steps.entity';
import { Tool } from 'src/tools/tool.entity';
import { Column, Entity, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn, OneToMany, ManyToMany, JoinTable, ManyToOne } from 'typeorm';
import { RecipeIngredient } from './recipe_ingrendient.entity';

@Entity("recipes")
export class Recipe {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column({ type: 'varchar', length: 50, nullable: false })
  name: string;

  @Column({ type: 'varchar', length: 255 })
  description: string;

  @Column({ type: 'varchar', length: 255, name: 'image_url' })
  imageUrl: string;

  @OneToMany(() => RecipeIngredient, (recipeIngredient) => recipeIngredient.recipe, { 
    eager: true,
    cascade: true,
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
  })
  ingredients: RecipeIngredient[];

  @ManyToMany(() => Tool, (tool) => tool.recipes, { eager: true })
  @JoinTable({ name: 'recipe_tools' })
  tools: Tool[];

  @OneToMany(() => Step, (step) => step.recipe, { 
    eager: true,
    cascade: true,
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
  })
  steps: Step[];

  @CreateDateColumn({ name: 'created_at' })
  createdAt: Date;

  @UpdateDateColumn({ name: 'updated_at' })
  updatedAt: Date;
}