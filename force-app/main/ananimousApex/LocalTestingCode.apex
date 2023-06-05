system.debug('\n \n ****' + DomainCoordinator.getDomainClassHandler('Quote'));


system.debug('\n ***** fine' + JSON.serialize(Database.query('SELECT Id, Name, (select OrderNumber From Orders) FROM Quote ORDER BY Name LIMIT 10 OFFSET 0')));