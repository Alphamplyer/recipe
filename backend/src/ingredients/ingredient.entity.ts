import { Column, Entity, PrimaryGeneratedColumn, CreateDateColumn, UpdateDateColumn } from 'typeorm';
import { SeasonalPeaks } from './seasonal_peaks';

@Entity("ingredients")
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'varchar', length: 50, nullable: false })
  name: string;

  @Column({ type: 'varchar', length: 255, name: 'image_url', nullable: false })
  imageUrl: string;

  @Column({ type: "number", array: true, length: 12, name: 'seasonal_peaks', default: [SeasonalPeaks.None] })
  seasonalPeaks: number[];

  @CreateDateColumn({ type: 'timestamptz', name: 'created_at' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamptz', name: 'updated_at' })
  updatedAt: Date;
}