package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.FeedBack;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;

/*IMPORT_MODEL*/

/**
 * Created by ataur on 1/25/17.
 */
@Repository
public interface FeedBackDataTableRepository extends DataTablesRepository<FeedBack, Integer>{
}

