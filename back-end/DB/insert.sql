INSERT INTO `gamification`.`universities` (`full_name`, `address`, `city`, `rating`, `username`, `password`, `description`, `photo`, `site`, `telephone`) VALUES ('Национальный аэрокосмический университет \"ХАИ\"', 'г. Харьков, ул. Чкалова, 17', 'Харьков', '5000', 'khayovnya', '1234567890', 'Тут супер!', '/photo1.jpg', 'www.khai.edu', '+380 57 788 4696');

INSERT INTO `gamification`.`departments` (`university_id`, `full_name`) VALUES ('1', 'k105(108)');

INSERT INTO `gamification`.`groups` (`name`, `faculty`, `department_id`, `rating`) VALUES ('126ст', 'Самолетостроительный', '1', '994');

INSERT INTO `gamification`.`teachers` (`name`, `surname`, `academic_rank`, `university_id`, `username`, `password`, `photo`) VALUES ('Сергей', 'Коба', 'аспирант', '1', 'desgnkiss', '123456789', '/avatar3.jpg');

INSERT INTO `gamification`.`students` (`id`, `group_id`, `name`, `surname`, `username`, `password`, `rating`, `photo`, `status`, `year`, `leader`) VALUES ('1', '1', 'Мария', 'Воробьева', 'maryart', '123456798', '150', '/4.png', 'студент', '3', '0');
