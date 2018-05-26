USE test;

DROP TABLE IF EXISTS book;

CREATE TABLE book (
  id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(255) NOT NULL,
  author varchar(100) NOT NULL,
  isbn varchar(20) NOT NULL,
  printYear INT(11) NOT NULL,
  readAlready TINYINT(4) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

# insert 25 items
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('1', 'First Book', 'THIS is description of the FIRST Book', 'Author of the FIRST Book', '1FIRST', '2000', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('2', 'Second Book', 'THIS is description of the SECOND Book', 'Author of the SECOND Book', '2SECOND', '2010', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('3', 'Third Book', 'THIS is description of the THIRD Book', 'Author of the THIRD Book', '3THIRD', '2002', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('4', 'Fourth Book', 'THIS is description of the FOURTH Book', 'Author of the FOURTH Book', '4FOURTH', '2010', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('5', 'Fifth Book', 'THIS is description of the FIFTH Book', 'Author of the FIFTH Book', '5FIFTH', '2008', '0');

INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('6', 'Sixth Book', 'THIS is description of the SIXTH Book', 'Author of the SIXTH Book', '6SIXTH', '2006', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('7', 'Seventh Book', 'THIS is description of the SEVENTH Book', 'Author of the SEVENTH Book', '7SEVENTH', '2007', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('8', 'Eighth Book', 'THIS is description of the EIGHTH Book', 'Author of the EIGHTH Book', '8EIGHTH', '2008', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('9', 'Ninth Book', 'THIS is description of the NINTH Book', 'Author of the NINTH Book', '9NINTH', '2000', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
    VALUES ('10', 'Tenth Book', 'THIS is description of the TENTH Book', 'Author of the TENTH Book', '10TENTH', '2008', '0');

INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('11', 'Eleventh Book', 'THIS is description of the ELEVENTH Book', 'Author of the ELEVENTH Book', '11ELEVENTH', '2001', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('12', 'Twelfth Book', 'THIS is description of the TWELFTH Book', 'Author of the TWELFTH Book', '12TWELFTH', '2005', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('13', 'Thirteenth Book', 'THIS is description of the THIRTEENTH Book', 'Author of the THIRTEENTH Book', '13THIRTEENTH', '2008', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('14', 'Fourteenth Book', 'THIS is description of the FOURTEENTH Book', 'Author of the FOURTEENTH Book', '14FOURTEENTH', '2010', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('15', 'Fifteenth Book', 'THIS is description of the FIFTEENTH Book', 'Author of the FIFTEENTH Book', '15FIFTEENTH', '2009', '0');

INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('16', 'Sixteenth Book', 'THIS is description of the SIXTEENTH Book', 'Author of the SIXTEENTH Book', '16SIXTEENTH', '2006', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('17', 'Seventeenth Book', 'THIS is description of the SEVENTEENTH Book', 'Author of the SEVENTEENTH Book', '17SEVENTEENTH', '2007', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('18', 'Eighteenth Book', 'THIS is description of the EIGHTEENTH Book', 'Author of the EIGHTEENTH Book', '18EIGHTEENTH', '2002', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('19', 'Nineteenth Book', 'THIS is description of the NINETEENTH Book', 'Author of the NINETEENTH Book', '19NINETEENTH', '2001', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('20', 'Twentieth Book', 'THIS is description of the TWENTIETH Book', 'Author of the TWENTIETH Book', '20TWENTIETH', '2007', '0');

INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('21', 'Twenty-First Book', 'THIS is description of the TWENTY-FIRST Book', 'Author of the TWENTY-FIRST Book', '21TWENTY-FIRST', '2000', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('22', 'Twenty-Second Book', 'THIS is description of the TWENTY-SECOND Book', 'Author of the TWENTY-SECOND Book', '22TWENTY-SECOND', '2010', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('23', 'Twenty-Third Book', 'THIS is description of the TWENTY-THIRD Book', 'Author of the TWENTY-THIRD Book', '23TWENTY-THIRD', '2002', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('24', 'Twenty-Fourth Book', 'THIS is description of the TWENTY-FOURTH Book', 'Author of the TWENTY-FOURTH Book', '24TWENTY-FOURTH', '2010', '0');
INSERT INTO book (id, title, description, author, isbn, printYear, readAlready)
VALUES ('25', 'Twenty-Fifth Book', 'THIS is description of the TWENTY-FIFTH Book', 'Author of the TWENTY-FIFTH Book', '25TWENTY-FIFTH', '2008', '0');