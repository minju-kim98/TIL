import { useContext, useEffect, useState } from "react";
import { doc, collection, addDoc, updateDoc, getDoc } from "firebase/firestore"; 
import { db } from "firebaseApp";
import AuthContext from "context/AuthContext";
import { useNavigate, useParams } from "react-router-dom";
import {toast} from "react-toastify";
import { PostProps } from "./PostList";

export default function PostForm() {
  const id = useParams()?.id;
  const [post, setPost] = useState<PostProps | null>(null);
  const [title, setTitle] = useState<string>("");
  const [summary, setSummary] = useState<string>("");
  const [content, setContent] = useState<string>("");
  const { user } = useContext(AuthContext);
  const navigate = useNavigate();

  const onSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      if(post && post.id){
        const postRef = doc(db, "posts", post?.id);
        await updateDoc(postRef,{
          title,
          summary,
          content,
          updatedAt: new Date()?.toLocaleDateString(),
        });
        navigate(`/posts/${post?.id}`);
        toast?.success("게시글을 수정했습니다.")
      }
      else{

        await addDoc(collection(db, "posts"), {
          title,
          summary,
          content,
          createAt: new Date()?.toLocaleDateString(),
          email: user?.email,
          uid: user?.uid,
        });
        toast?.success("게시글을 생성했습니다.")
        navigate("/");
      }
    } catch (err: any) {
        toast?.error(err?.code);
    }
  };

  const onChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    const {
      target: { name, value },
    } = e;

    if (name === "title") setTitle(value);
    if (name === "summary") setSummary(value);
    if (name === "content") setContent(value);
  };

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

  useEffect(() => {
    if (id) {
      getPost(id);
    }
  }, [id]);

  useEffect(() => {
    if (post) {
      setTitle(post?.title);
      setSummary(post?.summary);
      setContent(post?.content);
    }
  }, [post]);

  return (
    <form onSubmit={onSubmit} className="form">
      <div className="form__block">
        <label htmlFor="title">제목</label>
        <input
          type="text"
          name="title"
          id="title"
          required
          onChange={onChange}
          value={title}
        />
      </div>
      <div className="form__block">
        <label htmlFor="summary">요약</label>
        <input
          type="text"
          name="summary"
          id="summary"
          required
          onChange={onChange}
          value={summary}
        />
      </div>
      <div className="form__block">
        <label htmlFor="content">내용</label>
        <textarea
          name="content"
          id="content"
          required
          onChange={onChange}
          value={content}
        />
      </div>
      <div className="form__block">
        <input type="submit" value={post ? "수정" : "제출"} className="form__btn--submit" />
      </div>
    </form>
  );
}
