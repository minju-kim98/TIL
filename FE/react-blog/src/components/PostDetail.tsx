import { Link } from "react-router-dom";

export default function PostDetail() {
  return (
    <>
      <div className="post__detail">
        <div className="post__box">
          <div className="post__title">
            Lorem ipsum dolor sit amet consectetur adipisicing elit.
          </div>
          <div className="post__profile-box">
            <div className="post__profile" />
            <div className="post__author-name">페스트캠퍼스</div>
            <div className="post__date">2024.01.07 일요일</div>
          </div>
          <div className="post__utils-box">
            <div className="post__edit">
              <Link to={`/posts/edit/1`}>수정</Link>
            </div>
            <div className="post__delete">삭제</div>
          </div>
          <div className="post__text">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Minus
            maiores corporis, odio magnam consectetur unde molestias nobis?
            Earum error ullam reiciendis quam. Cum asperiores nemo corporis ex
            quasi esse fuga?
          </div>
        </div>
      </div>
    </>
  );
}
