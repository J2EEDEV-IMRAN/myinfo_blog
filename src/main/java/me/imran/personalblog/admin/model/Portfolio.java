package me.imran.personalblog.admin.model;

/**
 * @author Imran Hossain
 */

import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@Table(name="Portfolio")
//@EqualsAndHashCode
//@ToString(exclude = {"shortTitleFootnoteList","actRoleFootnoteList","preambleFootnoteList","actScheduleList"})
//@EntityListeners(ActEntityListener.class)
public class Portfolio implements Serializable{

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
	@Column(name="Title")
	@JsonView(DataTablesOutput.View.class)
	private String title;

	@Getter
	@Setter
	@Column(name="About")
	@JsonView(DataTablesOutput.View.class)
	private String about;

	@Getter
	@Setter
	@Column(name="Description")
	@JsonView(DataTablesOutput.View.class)
	private String description;

	@Getter
	@Setter
	@Column(name="Topic")
	@JsonView(DataTablesOutput.View.class)
	private String topic;

	@Getter
	@Setter
	@Column(name="Link")
	@JsonView(DataTablesOutput.View.class)
	private String link;

	@Getter
	@Setter
	@Column(name="orderNo")
	@JsonView(DataTablesOutput.View.class)
	private Integer  orderNo;

	@Getter
	@Setter
	@Column(name = "PortFolioImage")
	@JsonView(DataTablesOutput.View.class)
	private String portFolioImage;

	@Getter
	@Setter
	@Column(name="PublishDate")
	@JsonView(DataTablesOutput.View.class)
	private String publishDate;

	@Getter
	@Setter
	@Column(name="IsBanglaPortfolio")
	@JsonView(DataTablesOutput.View.class)
	private Boolean isBanglaPortfolio;

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

    public Portfolio() {
        super();
    }


}