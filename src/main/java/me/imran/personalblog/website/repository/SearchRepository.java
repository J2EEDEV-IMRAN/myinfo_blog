package me.imran.personalblog.website.repository;

import me.imran.personalblog.website.model.Search;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Imran Hossain
 */
public interface SearchRepository extends JpaRepository<Search,String> {
    Page<Search> findByTitleContainingIgnoreCaseOrDescriptionContainingIgnoreCase(String q, String q1, Pageable pageable);
}
