<?php

namespace Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

final class Version20190627005120 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE adherent_message_contact_list (
          id INT UNSIGNED AUTO_INCREMENT NOT NULL, 
          owner_id INT UNSIGNED DEFAULT NULL, 
          label VARCHAR(255) NOT NULL, 
          mailchimp_id INT DEFAULT NULL, 
          uuid CHAR(36) NOT NULL COMMENT \'(DC2Type:uuid)\', 
          INDEX IDX_3528814B7E3C61F9 (owner_id), 
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET UTF8 COLLATE UTF8_unicode_ci ENGINE = InnoDB');

        $this->addSql('CREATE TABLE adherent_message_contact (
          id INT AUTO_INCREMENT NOT NULL, 
          list_id INT UNSIGNED DEFAULT NULL, 
          adherent_id INT UNSIGNED DEFAULT NULL, 
          application_request_running_mate_id INT UNSIGNED DEFAULT NULL, 
          application_request_volunteer_id INT UNSIGNED DEFAULT NULL, 
          INDEX IDX_1CDF1E213DAE168B (list_id), 
          INDEX IDX_1CDF1E2125F06C53 (adherent_id), 
          INDEX IDX_1CDF1E21B0025B4B (
            application_request_running_mate_id
          ), 
          INDEX IDX_1CDF1E21753FBA9B (
            application_request_volunteer_id
          ), 
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET UTF8 COLLATE UTF8_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE 
          adherent_message_contact_list 
        ADD 
          CONSTRAINT FK_3528814B7E3C61F9 FOREIGN KEY (owner_id) REFERENCES adherents (id)');
        $this->addSql('ALTER TABLE 
          adherent_message_contact 
        ADD 
          CONSTRAINT FK_1CDF1E213DAE168B FOREIGN KEY (list_id) REFERENCES adherent_message_contact_list (id)');
        $this->addSql('ALTER TABLE 
          adherent_message_contact 
        ADD 
          CONSTRAINT FK_1CDF1E2125F06C53 FOREIGN KEY (adherent_id) REFERENCES adherents (id)');
        $this->addSql('ALTER TABLE 
          adherent_message_contact 
        ADD 
          CONSTRAINT FK_1CDF1E21B0025B4B FOREIGN KEY (
            application_request_running_mate_id
          ) REFERENCES application_request_running_mate (id)');
        $this->addSql('ALTER TABLE 
          adherent_message_contact 
        ADD 
          CONSTRAINT FK_1CDF1E21753FBA9B FOREIGN KEY (
            application_request_volunteer_id
          ) REFERENCES application_request_volunteer (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE adherent_message_contact DROP FOREIGN KEY FK_1CDF1E213DAE168B');
        $this->addSql('DROP TABLE adherent_message_contact_list');
        $this->addSql('DROP TABLE adherent_message_contact');
    }
}
