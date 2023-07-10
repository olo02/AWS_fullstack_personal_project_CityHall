    // 메뉴 드롭다운 
    $(function(){
        $(".menu li").eq(1).hover(function() {
            $(".sub-menu").stop().slideDown(800);
        }, function() {
            $(".sub-menu").stop().slideUp(800);
        });
    });

    // index.html : 이미지 슬라이드
    $(function(){
        $('.slider').bxSlider({
            auto : true,
            autoHover : true,
            pager : false,
            KeyboardEnabled : true
        });
        $('.slider').css('border-style','none')
    });


    // contract.html : 약관동의 의무
    $(function(){
        $("#allchk").click(function(){
            let checked = $(this).is(':checked');
            if(checked)
                $('input:checkbox').prop('checked',true);
            else
                $('input:checkbox').prop('checked',false);
        })
        $("input:checkbox").click(function() {
            let chk1 = $("#chk1").is(':checked');
            let chk2 = $("#chk2").is(':checked');
            if(chk1 && chk2)
                $("#allchk").prop('checked', true);
            else
                $("#allchk").prop('checked',false);
        })
        $(".next-btn").click(function(){
            let nonchk = !$("#allchk").is(':checked');
            if(nonchk){
                $(".next-btn a").prop("href","");
                alert("동의 후 가입이 가능합니다.");
            }
        })
    });

	// 로그아웃 메시지
		$(function() {
		    $("a[href$='logout']").click(function(){
		     //   event.preventDefault();
		        alert("방문해 주셔서 감사합니다. 행복한 하루 보내세요.")
			   // document.signinForm.submit();
			})
		});


	






    //         // 초기화
    //         // $("input").removeClass("invalid").parent().next().text("");
    //         // $.ajax("member.json").done(function(data){

    //         let id = $("input").eq(0).val();
    //         console.log(id);
    //         if(id.length < 4 || id.length > 15) {
    //             //문제상황
    //             $("input:eq(0)").addClass("invalid")
    //                 .parent().find("h6:nth-of-type(1)").css("color","blue");
    //                 return false;

    //         }
            // else{
            //         for(let i in data){
            //             if(id == data[i].id) {
            //                 $("input:eq(0)").addClass("invalid")
            //                     .parent().next().text("이미 존재하는 ID입니다.");
            //                 return false;
            //             }
            //         }
            //     }
            //     let pw = $("input").eq(1).val();
            //     if(pw.length < 4) {
            //         //문제상황
            //         $("input:eq(1)").addClass("invalid")
            //         .parent().next().text("PW는 4자 이상으로 작성하세요");
            //         return false;
            //     }
            //     let name = $("input").eq(2).val();
            //     if(!name.trim()) {
            //         //문제상황
            //         $("input:eq(2)").addClass("invalid")
            //         .parent().next().text("이름을 작성하세요");
            //         return false;
            //     }
            //     $(this).submit();
            // })
            // })
        // });

    // free.html & notice.html : 페이징 처리



    // write.html -> ? : 작성 글 추가


