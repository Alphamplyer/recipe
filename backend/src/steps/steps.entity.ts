import { Recipe } from 'src/recipes/recipe.entity';
import { Column, Entity, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn, OneToMany, ManyToOne, JoinColumn } from 'typeorm';

@Entity('steps')
export class Step {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'integer', name: 'number', nullable: false })
  number: number;

  @Column({ type: 'varchar', length: 1024, nullable: false })
  content: string;

  @ManyToOne(() => Recipe, (recipe) => recipe.steps, { onDelete: 'CASCADE' })
  @JoinColumn({ name: 'recipe_id' })
  recipe: Recipe;

  @CreateDateColumn({ type: 'timestamptz', name: 'created_at' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamptz', name: 'updated_at' })
  updatedAt: Date;
}