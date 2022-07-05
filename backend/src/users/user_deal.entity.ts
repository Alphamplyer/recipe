import { Column, Entity, PrimaryColumn, CreateDateColumn, UpdateDateColumn, OneToOne, JoinColumn } from 'typeorm';
import { User } from './user.entity';

@Entity("user_deals")
export class UserDeal {
  @PrimaryColumn({ type: 'uuid', name: 'user_id' })
  @OneToOne(() => User)
  @JoinColumn([{ name: 'user_id', referencedColumnName: 'id' }])
  user: User;

  @Column({ name: 'accept_terms', nullable: false })
  acceptTerms: boolean;

  @Column({ name: 'accept_privacy', nullable: false })
  acceptPrivacy: boolean;
}