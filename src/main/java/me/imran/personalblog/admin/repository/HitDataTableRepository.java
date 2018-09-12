package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.Hit;
/*IMPORT_MODEL*/
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Imran Hossain
 */
@Repository
public interface HitDataTableRepository extends DataTablesRepository<Hit, Integer>{
}

