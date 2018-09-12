package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.Portfolio;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;

/*IMPORT_MODEL*/

/**
 * @author Imran Hossain
 */
@Repository
public interface PortfolioDataTableRepository extends DataTablesRepository<Portfolio, Integer>{
}

