import { Link, useNavigate, useParams } from "react-router-dom";
import { PostProps } from "./PostList";
import { useState, useEffect } from "react";
import { doc, getDoc, deleteDoc } from "firebase/firestore";
import { db } from "firebaseApp";
import Loader from "./Loader";
import { toast } from "react-toastify";

export default function PostDetail() {
  const [post, setPost] = useState<PostProps | null>(null);
  const id = useParams()?.id;
  const navigate = useNavigate();

  const getPost = async (id: string) => {
    if (id) {
      const docRef = doc(db, "posts", id);
      const docSnap = await getDoc(docRef);

      if (docSnap.exists()) {
        setPost({ id: docSnap.id, ...(docSnap.data() as PostProps) });
      } else {
        setPost(null);
      }
    }
  };

  const handleDelete = async () => {
    const confirm = window.confirm("해당 게시글을 삭제하시겠습니까?");
    if(confirm && post && post.id){
      await deleteDoc(doc(db, "posts", post.id));
      toast.success("게시글이 삭제되었습니다.");
      navigate("/");
    }
  };

  useEffect(() => {
    if (id) {
      getPost(id);
    }
  }, [id]);

  return (
    <>
      <div className="post__detail">
        {post ? (
          <div className="post__box">
            <div className="post__title">
              {post?.title}
            </div>
            <div className="post__profile-box">
              <div className="post__profile" />
              <div className="post__author-name">{post?.email}</div>
              <div className="post__date">{post?.createAt}</div>
            </div>
            <div className="post__utils-box">
              <div className="post__edit">
                <Link to={`/posts/edit/${post?.id}`}>수정</Link>
              </div>
              <div className="post__delete" role='presentation' onClick={handleDelete}>삭제</div>
            </div>
            <div className="post__text post__text--pre-wrap">
              {post?.content}
            </div>
          </div>
        ) : (
          <Loader />
        )}
      </div>
    </>
  );
}
