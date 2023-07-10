package city.olooe.jsp.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class Board {
	private Long bno;
	@NonNull
	private String title;
	@NonNull
	private String content;
	@NonNull
	private String writer;
	
	// 
	private Date regdate; 
	
	private String updatedate; 
	
	private int hitcount;
	private Integer category;
	
	private String lockpw;
	private int replyCnt;

	
}
