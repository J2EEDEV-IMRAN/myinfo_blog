package me.imran.personalblog.admin.model;

/**
 * @author Imran Hossain
 */

import com.fasterxml.jackson.annotation.JsonView;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@Table(name="StaticPage")
@EqualsAndHashCode
@ToString
//@EntityListeners(StaticPageEntityListener.class)
public class StaticPage implements Serializable{

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    @Getter
    @Setter
    @JsonView(DataTablesOutput.View.class)
    private Integer id;

    
	@Getter
	@Setter
	@Column(name="PageUrl")
	@JsonView(DataTablesOutput.View.class)
	private String pageUrl;
	
	
	@Getter
	@Setter
	@Column(name="PageTitleEnglish")
	@JsonView(DataTablesOutput.View.class)
	private String pageTitleEnglish;
	
	
	@Getter
	@Setter
	@Column(name="PageTitleBangla")
	@JsonView(DataTablesOutput.View.class)
	private String pageTitleBangla;
	
	
	@Getter
	@Setter
	@Column(name="PageContentEnglish")
	@JsonView(DataTablesOutput.View.class)
	private String pageContentEnglish;
	
	
	@Getter
	@Setter
	@Column(name="PageContentBangla")
	@JsonView(DataTablesOutput.View.class)
	private String pageContentBangla;
	
	
	@Getter
	@Setter
	@Column(name="status")
	@JsonView(DataTablesOutput.View.class)
	private Boolean status;
	
	

    
    
    @Getter
    @Setter
    @Column(name="CreatedBy")
    @JsonView(DataTablesOutput.View.class)
    private String  createdBy;
            
    @Getter
    @Setter
    @Column(name="CreatedAt")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @JsonView(DataTablesOutput.View.class)
    private Date createdAt;
            
    @Getter
    @Setter
    @Column(name="UpdatedBy")
    @JsonView(DataTablesOutput.View.class)
    private String  updatedBy;
            
    @Getter
    @Setter
    @Column(name="UpdatedAt")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @JsonView(DataTablesOutput.View.class)
    private Date updatedAt;

    public StaticPage() {
        super();
    }


}