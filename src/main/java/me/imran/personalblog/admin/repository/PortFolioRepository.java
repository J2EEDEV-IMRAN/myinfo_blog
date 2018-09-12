package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.Portfolio;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/*IMPORT_MODEL*/

/**
 * @author Imran Hossain
 */
@Repository
public interface PortFolioRepository extends JpaRepository<Portfolio, Integer> {
	List<Portfolio> findAllByOrderByIdAsc();
	List<Portfolio> findAllByOrderByIdDesc();
	Page<Portfolio> findAllByOrderByIdAsc(Pageable page);
	Page<Portfolio> findAllByOrderByIdDesc(Pageable page);

	List<Portfolio> findByCreatedByOrderByIdAsc(String createdBy);
	List<Portfolio> findByCreatedByOrderByIdDesc(String createdBy);
	Page<Portfolio> findByCreatedByOrderByIdAsc(String createdBy, Pageable page);
	Page<Portfolio> findByCreatedByOrderByIdDesc(String createdBy, Pageable page);
	Portfolio findOneByTitle(String title);
	List<Portfolio> findAllByOrderByTitleAsc();


    @Query(value = "SELECT * FROM Portfolio t order by id desc limit 1", nativeQuery=true)
	Portfolio getNewPortfolio();

}

